import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_entities.freezed.dart';
part 'weather_entities.g.dart';

@freezed
class WeatherCurrent with _$WeatherCurrent {
  const factory WeatherCurrent({
    required String location,
    required double temperature,
    required String conditions,
    required String icon,
    required double humidity,
    required double windSpeed,
    required double pressure,
    required DateTime datetime,
    required double feelsLike,
    required double uvIndex,
    required double visibility,
  }) = _WeatherCurrent;

  factory WeatherCurrent.fromJson(Map<String, dynamic> json) =>
      _$WeatherCurrentFromJson(json);
}

@freezed
class WeatherForecast with _$WeatherForecast {
  const factory WeatherForecast({
    required String location,
    required List<WeatherDay> days,
  }) = _WeatherForecast;

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);
}

@freezed
class WeatherDay with _$WeatherDay {
  const factory WeatherDay({
    required DateTime date,
    required double tempMax,
    required double tempMin,
    required String conditions,
    required String icon,
    required double humidity,
    required double windSpeed,
    required double precipitationProbability,
    required String description,
  }) = _WeatherDay;

  factory WeatherDay.fromJson(Map<String, dynamic> json) =>
      _$WeatherDayFromJson(json);
}

@freezed
class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent({
    required String id,
    required String type,
    required String title,
    required String description,
    required DateTime startTime,
    required DateTime? endTime,
    required String severity,
    required double latitude,
    required double longitude,
    @Default(false) bool isFavorite,
  }) = _WeatherEvent;

  factory WeatherEvent.fromJson(Map<String, dynamic> json) =>
      _$WeatherEventFromJson(json);
}

@freezed
class LocationInfo with _$LocationInfo {
  const factory LocationInfo({
    required String name,
    required String country,
    required String region,
    required double latitude,
    required double longitude,
  }) = _LocationInfo;

  factory LocationInfo.fromJson(Map<String, dynamic> json) =>
      _$LocationInfoFromJson(json);
}
