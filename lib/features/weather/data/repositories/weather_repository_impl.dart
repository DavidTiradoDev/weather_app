import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/weather_entities.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_api_service.dart';
import '../models/weather_dtos.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService _apiService;
  final SharedPreferences _sharedPreferences;
  final Connectivity _connectivity;
  final Logger _logger;

  WeatherRepositoryImpl({
    required WeatherApiService apiService,
    required SharedPreferences sharedPreferences,
    required Connectivity connectivity,
    required Logger logger,
  }) : _apiService = apiService,
       _sharedPreferences = sharedPreferences,
       _connectivity = connectivity,
       _logger = logger;

  @override
  Future<Result<WeatherCurrent>> getCurrentWeather(
    LocationInfo location,
  ) async {
    try {
      // Check connectivity
      if (!await isConnected()) {
        // Try to get cached data
        final cachedData = await getCachedWeatherData<Map<String, dynamic>>(
          '${AppConstants.currentWeatherCacheKey}_${location.name}',
        );

        if (cachedData != null) {
          final weatherDto = WeatherResponseDto.fromJson(cachedData);
          return Success(weatherDto.toCurrentWeather());
        }

        return const Error(Failure.network(message: 'Sin conexión a internet'));
      }

      final locationString = '${location.latitude},${location.longitude}';

      final response = await _apiService.getCurrentWeather(
        locationString,
        AppConstants.apiKey,
        AppConstants.units,
        'current',
        AppConstants.language,
      );

      // Cache the response
      await cacheWeatherData(
        '${AppConstants.currentWeatherCacheKey}_${location.name}',
        response.toJson(),
      );

      return Success(response.toCurrentWeather());
    } on DioException catch (e) {
      _logger.e('API Error getting current weather: ${e.message}');

      if (e.response?.statusCode == 429) {
        return const Error(
          Failure.server(message: 'Límite de consultas excedido', code: 429),
        );
      }

      return Error(
        Failure.server(
          message: e.message ?? 'Error del servidor',
          code: e.response?.statusCode ?? 500,
        ),
      );
    } catch (e) {
      _logger.e('Unknown error getting current weather: $e');
      return Error(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Result<WeatherForecast>> getForecast(LocationInfo location) async {
    try {
      if (!await isConnected()) {
        final cachedData = await getCachedWeatherData<Map<String, dynamic>>(
          '${AppConstants.forecastCacheKey}_${location.name}',
        );

        if (cachedData != null) {
          final weatherDto = WeatherResponseDto.fromJson(cachedData);
          return Success(weatherDto.toForecast());
        }

        return const Error(Failure.network(message: 'Sin conexión a internet'));
      }

      final locationString = '${location.latitude},${location.longitude}';

      final response = await _apiService.getForecast(
        locationString,
        AppConstants.apiKey,
        AppConstants.units,
        'days',
        AppConstants.language,
      );

      await cacheWeatherData(
        '${AppConstants.forecastCacheKey}_${location.name}',
        response.toJson(),
      );

      return Success(response.toForecast());
    } on DioException catch (e) {
      _logger.e('API Error getting forecast: ${e.message}');
      return Error(
        Failure.server(
          message: e.message ?? 'Error del servidor',
          code: e.response?.statusCode ?? 500,
        ),
      );
    } catch (e) {
      _logger.e('Unknown error getting forecast: $e');
      return Error(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Result<List<WeatherEvent>>> getWeatherEvents(
    LocationInfo location,
  ) async {
    try {
      if (!await isConnected()) {
        final cachedData = await getCachedWeatherData<List<dynamic>>(
          '${AppConstants.eventsCacheKey}_${location.name}',
        );

        if (cachedData != null) {
          final events =
              cachedData
                  .map((e) => EventDto.fromJson(e as Map<String, dynamic>))
                  .map((dto) => dto.toWeatherEvent())
                  .toList();
          return Success(events);
        }

        return const Error(Failure.network(message: 'Sin conexión a internet'));
      }

      // Crear algunos eventos mock para probar favoritos
      final mockEvents = [
        WeatherEvent(
          id: 'wind_event_1',
          type: 'wind',
          title: 'Alerta de Viento',
          description: 'Vientos fuertes de hasta 45 km/h esperados esta tarde',
          startTime: DateTime.now().add(const Duration(hours: 2)),
          endTime: DateTime.now().add(const Duration(hours: 6)),
          severity: 'moderate',
          latitude: location.latitude,
          longitude: location.longitude,
        ),
        WeatherEvent(
          id: 'rain_event_1',
          type: 'rain',
          title: 'Lluvia Intensa',
          description: 'Precipitaciones fuertes durante la noche',
          startTime: DateTime.now().add(const Duration(hours: 8)),
          endTime: DateTime.now().add(const Duration(hours: 12)),
          severity: 'severe',
          latitude: location.latitude,
          longitude: location.longitude,
        ),
      ];

      return Success(mockEvents);

      // Código comentado para eventos reales:
      /*
      final locationString = '${location.latitude},${location.longitude}';
      
      final response = await _apiService.getWeatherEvents(
        locationString,
        AppConstants.apiKey,
        'events',
        'wind,rain,snow,ice,hail,tornado',
        AppConstants.language,
      );

      final events = response.events.map((dto) => dto.toWeatherEvent()).toList();

      await cacheWeatherData(
        '${AppConstants.eventsCacheKey}_${location.name}',
        response.events.map((e) => e.toJson()).toList(),
      );

      return Success(events);
      */
    } catch (e) {
      _logger.e('Error getting events: $e');
      return const Success([]); // Devolver lista vacía en caso de error
    }
  }

  @override
  Future<Result<LocationInfo>> getCurrentLocation() async {
    try {
      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return const Error(
            Failure.permission(message: 'Permisos de ubicación denegados'),
          );
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return const Error(
          Failure.permission(
            message: 'Permisos de ubicación denegados permanentemente',
          ),
        );
      }

      // Get current position
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Create location info with a descriptive name
      final location = LocationInfo(
        name: 'Mi ubicación actual',
        country: 'Colombia',
        region: 'Antioquia',
        latitude: position.latitude,
        longitude: position.longitude,
      );

      // Cache last known location
      await cacheWeatherData(
        AppConstants.lastLocationCacheKey,
        location.toJson(),
      );

      return Success(location);
    } catch (e) {
      _logger.e('Error getting current location: $e');

      // Try to get cached location
      final cachedData = await getCachedWeatherData<Map<String, dynamic>>(
        AppConstants.lastLocationCacheKey,
      );

      if (cachedData != null) {
        return Success(LocationInfo.fromJson(cachedData));
      }

      // Return default location (Medellín) with a clear name
      return Success(
        LocationInfo(
          name: AppConstants.defaultLocationName,
          country: 'Colombia',
          region: 'Antioquia',
          latitude: AppConstants.defaultLatitude,
          longitude: AppConstants.defaultLongitude,
        ),
      );
    }
  }

  @override
  Future<Result<List<LocationInfo>>> searchLocations(String query) async {
    try {
      // This is a simplified implementation
      // In a real app, you'd use a geocoding service
      final locations = <LocationInfo>[
        LocationInfo(
          name: 'Medellín, Colombia',
          country: 'Colombia',
          region: 'Antioquia',
          latitude: 6.2442,
          longitude: -75.5812,
        ),
        LocationInfo(
          name: 'Bogotá, Colombia',
          country: 'Colombia',
          region: 'Cundinamarca',
          latitude: 4.7110,
          longitude: -74.0721,
        ),
        LocationInfo(
          name: 'Cali, Colombia',
          country: 'Colombia',
          region: 'Valle del Cauca',
          latitude: 3.4516,
          longitude: -76.5320,
        ),
      ];

      final filteredLocations =
          locations
              .where(
                (location) =>
                    location.name.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();

      return Success(filteredLocations);
    } catch (e) {
      _logger.e('Error searching locations: $e');
      return Error(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<bool> isConnected() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Future<void> cacheWeatherData(String key, dynamic data) async {
    try {
      final jsonString = jsonEncode(data);
      await _sharedPreferences.setString(key, jsonString);

      // Store timestamp
      await _sharedPreferences.setInt(
        '${key}_timestamp',
        DateTime.now().millisecondsSinceEpoch,
      );
    } catch (e) {
      _logger.e('Error caching data: $e');
    }
  }

  @override
  Future<T?> getCachedWeatherData<T>(String key) async {
    try {
      final timestamp = _sharedPreferences.getInt('${key}_timestamp');
      if (timestamp == null) return null;

      final cacheTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      final now = DateTime.now();

      // Check if cache is expired
      if (now.difference(cacheTime) > AppConstants.cacheDuration) {
        return null;
      }

      final jsonString = _sharedPreferences.getString(key);
      if (jsonString == null) return null;

      return jsonDecode(jsonString) as T;
    } catch (e) {
      _logger.e('Error getting cached data: $e');
      return null;
    }
  }
}
