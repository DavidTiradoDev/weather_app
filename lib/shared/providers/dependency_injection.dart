import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/favorites/data/models/sqflite_models.dart';
import 'package:weather_app/features/favorites/data/repositories/favorites_repositories_impl.dart';
import 'package:weather_app/features/favorites/domain/repositories/favorites_repositories.dart';

import '../../core/constants/app_constants.dart';
import '../../features/weather/data/datasources/weather_api_service.dart';
import '../../features/weather/data/repositories/weather_repository_impl.dart';
import '../../features/weather/domain/repositories/weather_repository.dart';

// Core dependencies
final loggerProvider = Provider<Logger>((ref) {
  return Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
    ),
  );
});

final connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be initialized');
});

// Database
final favoritesDatabaseProvider = Provider<FavoritesDatabase>((ref) {
  return FavoritesDatabase();
});

// HTTP client
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();

  dio.options.baseUrl = AppConstants.baseUrl;
  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.options.receiveTimeout = const Duration(seconds: 30);

  // Add interceptors
  dio.interceptors.add(
    LogInterceptor(
      requestBody: false,
      responseBody: false,
      requestHeader: false,
      responseHeader: false,
      error: true,
      logPrint: (object) => ref.read(loggerProvider).d(object),
    ),
  );

  return dio;
});

// API Services
final weatherApiServiceProvider = Provider<WeatherApiService>((ref) {
  final dio = ref.read(dioProvider);
  return WeatherApiService(dio);
});

// Repositories
final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepositoryImpl(
    apiService: ref.read(weatherApiServiceProvider),
    sharedPreferences: ref.read(sharedPreferencesProvider),
    connectivity: ref.read(connectivityProvider),
    logger: ref.read(loggerProvider),
  );
});

final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
  return FavoritesRepositoryImpl(
    database: ref.read(favoritesDatabaseProvider),
    logger: ref.read(loggerProvider),
  );
});

// Initialize dependencies
class DependencyInjection {
  static Future<void> init() async {
    // Initialize database
    final database = FavoritesDatabase();
    await database.database; // Initialize the database
  }

  static ProviderContainer createContainer(
    SharedPreferences sharedPreferences,
  ) {
    return ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
    );
  }
}
