import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../../core/errors/failures.dart';
import '../entities/weather_entities.dart';

abstract class WeatherRepository {
  Future<Result<WeatherCurrent>> getCurrentWeather(LocationInfo location);
  Future<Result<WeatherForecast>> getForecast(LocationInfo location);
  Future<Result<List<WeatherEvent>>> getWeatherEvents(LocationInfo location);
  Future<Result<LocationInfo>> getCurrentLocation();
  Future<Result<List<LocationInfo>>> searchLocations(String query);
  Future<bool> isConnected();
  Future<void> cacheWeatherData(String key, dynamic data);
  Future<T?> getCachedWeatherData<T>(String key);
}

// Result type for handling success/failure
sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  const Success(this.data);
  final T data;
}

class Error<T> extends Result<T> {
  const Error(this.failure);
  final Failure failure;
}

// Extension for easier handling
extension ResultX<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isError => this is Error<T>;

  T? get data => switch (this) {
    Success<T> success => success.data,
    Error<T> _ => null,
  };

  Failure? get failure => switch (this) {
    Success<T> _ => null,
    Error<T> error => error.failure,
  };

  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) error,
  }) {
    return switch (this) {
      Success<T> s => success(s.data),
      Error<T> e => error(e.failure),
    };
  }
}
