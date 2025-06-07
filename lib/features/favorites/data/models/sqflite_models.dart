import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../domain/entities/favorite_entities.dart';

// Database helper for favorites
class FavoritesDatabase {
  static final FavoritesDatabase _instance = FavoritesDatabase._internal();
  factory FavoritesDatabase() => _instance;
  FavoritesDatabase._internal();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'weather_favorites.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favorite_events (
        id TEXT PRIMARY KEY,
        type TEXT NOT NULL,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        start_time INTEGER NOT NULL,
        end_time INTEGER,
        severity TEXT NOT NULL,
        latitude REAL NOT NULL,
        longitude REAL NOT NULL,
        added_at INTEGER NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE weather_cache (
        key TEXT PRIMARY KEY,
        data TEXT NOT NULL,
        timestamp INTEGER NOT NULL,
        expires_at INTEGER NOT NULL
      )
    ''');
  }

  // Favorite Events methods
  Future<List<FavoriteEventEntity>> getAllFavoriteEvents() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favorite_events');

    return List.generate(maps.length, (i) {
      return FavoriteEventEntity(
        id: maps[i]['id'],
        type: maps[i]['type'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        startTime: DateTime.fromMillisecondsSinceEpoch(maps[i]['start_time']),
        endTime:
            maps[i]['end_time'] != null
                ? DateTime.fromMillisecondsSinceEpoch(maps[i]['end_time'])
                : null,
        severity: maps[i]['severity'],
        latitude: maps[i]['latitude'],
        longitude: maps[i]['longitude'],
        addedAt: DateTime.fromMillisecondsSinceEpoch(maps[i]['added_at']),
      );
    });
  }

  Future<void> insertFavoriteEvent(FavoriteEventEntity event) async {
    final db = await database;
    await db.insert('favorite_events', {
      'id': event.id,
      'type': event.type,
      'title': event.title,
      'description': event.description,
      'start_time': event.startTime.millisecondsSinceEpoch,
      'end_time': event.endTime?.millisecondsSinceEpoch,
      'severity': event.severity,
      'latitude': event.latitude,
      'longitude': event.longitude,
      'added_at': event.addedAt.millisecondsSinceEpoch,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteFavoriteEvent(String id) async {
    final db = await database;
    await db.delete('favorite_events', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> isFavorite(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'favorite_events',
      where: 'id = ?',
      whereArgs: [id],
    );
    return maps.isNotEmpty;
  }

  // Weather Cache methods
  Future<void> insertCache(String key, String data, Duration ttl) async {
    final db = await database;
    final now = DateTime.now();
    await db.insert('weather_cache', {
      'key': key,
      'data': data,
      'timestamp': now.millisecondsSinceEpoch,
      'expires_at': now.add(ttl).millisecondsSinceEpoch,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<String?> getCache(String key) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'weather_cache',
      where: 'key = ? AND expires_at > ?',
      whereArgs: [key, DateTime.now().millisecondsSinceEpoch],
    );

    if (maps.isEmpty) {
      return null;
    }

    return maps.first['data'];
  }

  Future<void> clearExpiredCache() async {
    final db = await database;
    await db.delete(
      'weather_cache',
      where: 'expires_at < ?',
      whereArgs: [DateTime.now().millisecondsSinceEpoch],
    );
  }
}
