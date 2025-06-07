import 'package:logger/logger.dart';
import 'package:weather_app/features/favorites/data/models/sqflite_models.dart';
import 'package:weather_app/features/favorites/domain/repositories/favorites_repositories.dart';
import '../../../weather/domain/repositories/weather_repository.dart';
import '../../domain/entities/favorite_entities.dart';
import '../../../weather/domain/entities/weather_entities.dart';
import '../../../../core/errors/failures.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesDatabase _database;
  final Logger _logger;

  FavoritesRepositoryImpl({
    required FavoritesDatabase database,
    required Logger logger,
  }) : _database = database,
       _logger = logger;

  @override
  Future<Result<List<FavoriteEventEntity>>> getAllFavorites() async {
    try {
      final favorites = await _database.getAllFavoriteEvents();
      return Success(favorites);
    } catch (e) {
      _logger.e('Error getting all favorites: $e');
      return Error(Failure.cache(message: 'Error cargando favoritos: $e'));
    }
  }

  @override
  Future<Result<void>> addToFavorites(WeatherEvent event) async {
    try {
      // Verificar si ya existe
      final isAlreadyFavorite = await _database.isFavorite(event.id);
      if (isAlreadyFavorite) {
        return const Success(null);
      }

      // Convertir a FavoriteEventEntity
      final favoriteEntity = FavoriteEventEntity.fromWeatherEvent(event);

      // Guardar en la base de datos
      await _database.insertFavoriteEvent(favoriteEntity);

      _logger.i('Added event ${event.id} to favorites');
      return const Success(null);
    } catch (e) {
      _logger.e('Error adding to favorites: $e');
      return Error(Failure.cache(message: 'Error agregando a favoritos: $e'));
    }
  }

  @override
  Future<Result<void>> removeFromFavorites(String eventId) async {
    try {
      await _database.deleteFavoriteEvent(eventId);
      _logger.i('Removed event $eventId from favorites');
      return const Success(null);
    } catch (e) {
      _logger.e('Error removing from favorites: $e');
      return Error(Failure.cache(message: 'Error removiendo de favoritos: $e'));
    }
  }

  @override
  Future<Result<bool>> isFavorite(String eventId) async {
    try {
      final isFav = await _database.isFavorite(eventId);
      return Success(isFav);
    } catch (e) {
      _logger.e('Error checking if favorite: $e');
      return const Success(false); // Default to false on error
    }
  }

  @override
  Future<Result<void>> clearAllFavorites() async {
    try {
      final favorites = await _database.getAllFavoriteEvents();
      for (final favorite in favorites) {
        await _database.deleteFavoriteEvent(favorite.id);
      }
      _logger.i('Cleared all favorites');
      return const Success(null);
    } catch (e) {
      _logger.e('Error clearing favorites: $e');
      return Error(Failure.cache(message: 'Error limpiando favoritos: $e'));
    }
  }

  @override
  Future<Result<void>> cacheWeatherData(
    String key,
    String data,
    Duration ttl,
  ) async {
    try {
      await _database.insertCache(key, data, ttl);
      return const Success(null);
    } catch (e) {
      _logger.e('Error caching data: $e');
      return Error(Failure.cache(message: 'Error guardando en cache: $e'));
    }
  }

  @override
  Future<Result<String?>> getCachedWeatherData(String key) async {
    try {
      final data = await _database.getCache(key);
      return Success(data);
    } catch (e) {
      _logger.e('Error getting cached data: $e');
      return const Success(null); // Return null on error
    }
  }

  @override
  Future<Result<void>> clearExpiredCache() async {
    try {
      await _database.clearExpiredCache();
      return const Success(null);
    } catch (e) {
      _logger.e('Error clearing expired cache: $e');
      return Error(Failure.cache(message: 'Error limpiando cache: $e'));
    }
  }
}
