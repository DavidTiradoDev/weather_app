import 'package:mockito/annotations.dart';
import 'package:weather_app/features/weather/data/datasources/weather_api_service.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/favorites/domain/repositories/favorites_repositories.dart';
import 'package:weather_app/features/favorites/data/models/sqflite_models.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

// Genera los mocks automáticamente basados en TU proyecto real
@GenerateMocks([
  // Repositories (tus interfaces reales)
  WeatherRepository,
  FavoritesRepository,

  // DataSources (tus servicios reales)
  WeatherApiService,
  FavoritesDatabase,

  // External dependencies (las que realmente usas)
  Dio,
  Connectivity,
  SharedPreferences,
  Logger,
])
void main() {}
