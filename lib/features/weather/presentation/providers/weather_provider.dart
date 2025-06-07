import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/core/errors/failures.dart';

import '../../../../shared/providers/dependency_injection.dart';
import '../../domain/entities/weather_entities.dart';
import '../../domain/repositories/weather_repository.dart';
import 'weather_state.dart';

part 'weather_provider.g.dart';

@riverpod
class WeatherNotifier extends _$WeatherNotifier {
  late WeatherRepository _repository;

  @override
  WeatherState build() {
    _repository = ref.read(weatherRepositoryProvider);
    _checkConnectivity();
    return const WeatherState();
  }

  Future<void> _checkConnectivity() async {
    final isConnected = await _repository.isConnected();
    state = state.copyWith(isConnected: isConnected);
  }

  Future<void> loadCurrentWeather([LocationInfo? location]) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Get location if not provided
      final targetLocation = location ?? state.currentLocation;
      if (targetLocation == null) {
        await getCurrentLocation();
        return loadCurrentWeather(state.currentLocation);
      }

      final result = await _repository.getCurrentWeather(targetLocation);

      result.when(
        success: (weather) {
          state = state.copyWith(
            isLoading: false,
            currentWeather: weather,
            error: null,
          );
        },
        error: (failure) {
          state = state.copyWith(isLoading: false, error: failure);
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: const Failure.unknown(message: 'Error inesperado'),
      );
    }
  }

  Future<void> loadForecast([LocationInfo? location]) async {
    state = state.copyWith(isLoadingForecast: true, error: null);

    try {
      final targetLocation = location ?? state.currentLocation;
      if (targetLocation == null) return;

      final result = await _repository.getForecast(targetLocation);

      result.when(
        success: (forecast) {
          state = state.copyWith(
            isLoadingForecast: false,
            forecast: forecast,
            error: null,
          );
        },
        error: (failure) {
          state = state.copyWith(isLoadingForecast: false, error: failure);
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingForecast: false,
        error: const Failure.unknown(message: 'Error inesperado'),
      );
    }
  }

  Future<void> loadWeatherEvents([LocationInfo? location]) async {
    state = state.copyWith(isLoadingEvents: true, error: null);

    try {
      final targetLocation = location ?? state.currentLocation;
      if (targetLocation == null) return;

      final result = await _repository.getWeatherEvents(targetLocation);

      result.when(
        success: (events) {
          state = state.copyWith(
            isLoadingEvents: false,
            events: events,
            error: null,
          );
        },
        error: (failure) {
          state = state.copyWith(isLoadingEvents: false, error: failure);
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingEvents: false,
        error: const Failure.unknown(message: 'Error inesperado'),
      );
    }
  }

  Future<void> getCurrentLocation() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final result = await _repository.getCurrentLocation();

      result.when(
        success: (location) {
          state = state.copyWith(
            currentLocation: location,
            isLoading: false,
            error: null,
          );
        },
        error: (failure) {
          state = state.copyWith(isLoading: false, error: failure);
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: const Failure.unknown(message: 'Error obteniendo ubicación'),
      );
    }
  }

  Future<void> refreshWeatherData() async {
    await _checkConnectivity();

    if (state.currentLocation != null) {
      await Future.wait([
        loadCurrentWeather(),
        loadForecast(),
        loadWeatherEvents(),
      ]);
    } else {
      await getCurrentLocation();
      if (state.currentLocation != null) {
        await refreshWeatherData();
      }
    }
  }

  void setLocation(LocationInfo location) {
    state = state.copyWith(currentLocation: location);
    refreshWeatherData();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
