import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/weather_entities.dart';

part 'weather_state.freezed.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingForecast,
    @Default(false) bool isLoadingEvents,
    WeatherCurrent? currentWeather,
    WeatherForecast? forecast,
    @Default([]) List<WeatherEvent> events,
    LocationInfo? currentLocation,
    Failure? error,
    @Default(false) bool isConnected,
  }) = _WeatherState;
}

@freezed
class LocationState with _$LocationState {
  const factory LocationState({
    @Default(false) bool isLoading,
    @Default([]) List<LocationInfo> searchResults,
    LocationInfo? selectedLocation,
    Failure? error,
  }) = _LocationState;
}

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @Default(false) bool isLoading,
    @Default([]) List<WeatherEvent> favoriteEvents,
    Failure? error,
  }) = _FavoritesState;
}
