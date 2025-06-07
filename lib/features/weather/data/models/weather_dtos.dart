import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/weather_entities.dart';

part 'weather_dtos.freezed.dart';
part 'weather_dtos.g.dart';

// DTO simplificado para evitar crashes
@freezed
class WeatherResponseDto with _$WeatherResponseDto {
  const factory WeatherResponseDto({
    required String resolvedAddress,
    String? timezone,
    CurrentConditionsDto? currentConditions,
    @Default([]) List<DayDto> days,
  }) = _WeatherResponseDto;

  factory WeatherResponseDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseDtoFromJson(json);
}

@freezed
class CurrentConditionsDto with _$CurrentConditionsDto {
  const factory CurrentConditionsDto({
    required String datetime,
    @Default(0.0) double temp,
    @Default(0.0) double feelslike,
    @Default(0.0) double humidity,
    @Default(0.0) double windspeed,
    @Default(0.0) double pressure,
    @Default(0.0) double uvindex,
    @Default(0.0) double visibility,
    @Default('') String conditions,
    @Default('clear-day') String icon,
  }) = _CurrentConditionsDto;

  factory CurrentConditionsDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentConditionsDtoFromJson(json);
}

@freezed
class DayDto with _$DayDto {
  const factory DayDto({
    required String datetime,
    @Default(0.0) double tempmax,
    @Default(0.0) double tempmin,
    @Default(0.0) double humidity,
    @Default(0.0) double windspeed,
    @Default(0.0) double precipprob,
    @Default('') String conditions,
    @Default('') String description,
    @Default('clear-day') String icon,
  }) = _DayDto;

  factory DayDto.fromJson(Map<String, dynamic> json) => _$DayDtoFromJson(json);
}

// DTO para eventos (simplificado)
@freezed
class WeatherEventsResponseDto with _$WeatherEventsResponseDto {
  const factory WeatherEventsResponseDto({
    required String resolvedAddress,
    @Default([]) List<EventDto> events,
  }) = _WeatherEventsResponseDto;

  factory WeatherEventsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherEventsResponseDtoFromJson(json);
}

@freezed
class EventDto with _$EventDto {
  const factory EventDto({
    @Default('') String type,
    @Default('') String datetime,
    String? endtime,
    @Default('minor') String severity,
    @Default(0.0) double latitude,
    @Default(0.0) double longitude,
    @Default('') String description,
  }) = _EventDto;

  factory EventDto.fromJson(Map<String, dynamic> json) =>
      _$EventDtoFromJson(json);
}

// Extensiones más seguras
extension WeatherResponseDtoX on WeatherResponseDto {
  WeatherCurrent toCurrentWeather() {
    try {
      final current = currentConditions ?? _createCurrentFromFirstDay();

      return WeatherCurrent(
        location: resolvedAddress,
        temperature: current.temp,
        conditions: current.conditions,
        icon: current.icon,
        humidity: current.humidity,
        windSpeed: current.windspeed,
        pressure: current.pressure,
        datetime: _parseDateTime(current.datetime),
        feelsLike: current.feelslike,
        uvIndex: current.uvindex,
        visibility: current.visibility,
      );
    } catch (e) {
      // Fallback en caso de error
      return WeatherCurrent(
        location: resolvedAddress,
        temperature: 20.0,
        conditions: 'Despejado',
        icon: 'clear-day',
        humidity: 50.0,
        windSpeed: 10.0,
        pressure: 1013.0,
        datetime: DateTime.now(),
        feelsLike: 20.0,
        uvIndex: 5.0,
        visibility: 10.0,
      );
    }
  }

  CurrentConditionsDto _createCurrentFromFirstDay() {
    if (days.isEmpty) {
      return const CurrentConditionsDto(
        datetime: '',
        temp: 20.0,
        conditions: 'Despejado',
      );
    }

    final firstDay = days.first;
    final now = DateTime.now();

    return CurrentConditionsDto(
      datetime:
          '${firstDay.datetime}T${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:00',
      temp: (firstDay.tempmax + firstDay.tempmin) / 2,
      feelslike: (firstDay.tempmax + firstDay.tempmin) / 2,
      humidity: firstDay.humidity,
      windspeed: firstDay.windspeed,
      pressure: 1013.25,
      uvindex: 5.0,
      visibility: 10.0,
      conditions: firstDay.conditions,
      icon: firstDay.icon,
    );
  }

  WeatherForecast toForecast() {
    try {
      return WeatherForecast(
        location: resolvedAddress,
        days: days.map((day) => day.toWeatherDay()).toList(),
      );
    } catch (e) {
      // Fallback en caso de error
      return WeatherForecast(location: resolvedAddress, days: []);
    }
  }

  DateTime _parseDateTime(String datetime) {
    try {
      if (datetime.isEmpty) return DateTime.now();

      if (datetime.contains('T')) {
        return DateTime.parse(datetime);
      } else if (datetime.contains(' ')) {
        return DateTime.parse(datetime);
      } else if (datetime.length == 10) {
        return DateTime.parse('${datetime}T12:00:00');
      } else {
        final now = DateTime.now();
        final today = DateTime(now.year, now.month, now.day);
        final timeParts = datetime.split(':');
        if (timeParts.length >= 2) {
          return today.add(
            Duration(
              hours: int.tryParse(timeParts[0]) ?? 12,
              minutes: int.tryParse(timeParts[1]) ?? 0,
            ),
          );
        }
      }
    } catch (e) {
      // Si falla, devolver fecha actual
    }
    return DateTime.now();
  }
}

extension DayDtoX on DayDto {
  WeatherDay toWeatherDay() {
    try {
      return WeatherDay(
        date: DateTime.parse(datetime),
        tempMax: tempmax,
        tempMin: tempmin,
        conditions: conditions,
        icon: icon,
        humidity: humidity,
        windSpeed: windspeed,
        precipitationProbability: precipprob,
        description: description,
      );
    } catch (e) {
      // Fallback en caso de error
      return WeatherDay(
        date: DateTime.now(),
        tempMax: 25.0,
        tempMin: 15.0,
        conditions: 'Despejado',
        icon: 'clear-day',
        humidity: 50.0,
        windSpeed: 10.0,
        precipitationProbability: 0.0,
        description: 'Clima despejado',
      );
    }
  }
}

extension EventDtoX on EventDto {
  WeatherEvent toWeatherEvent() {
    try {
      return WeatherEvent(
        id: '${type}_${datetime}_${latitude}_${longitude}',
        type: type,
        title: _getEventTitle(type),
        description: description,
        startTime: DateTime.tryParse(datetime) ?? DateTime.now(),
        endTime: endtime != null ? DateTime.tryParse(endtime!) : null,
        severity: severity,
        latitude: latitude,
        longitude: longitude,
      );
    } catch (e) {
      // Fallback en caso de error
      return WeatherEvent(
        id: 'default_event',
        type: 'info',
        title: 'Información',
        description: 'Sin descripción',
        startTime: DateTime.now(),
        endTime: null,
        severity: 'minor',
        latitude: 0.0,
        longitude: 0.0,
      );
    }
  }

  String _getEventTitle(String type) {
    switch (type.toLowerCase()) {
      case 'wind':
        return 'Alerta de Viento';
      case 'rain':
        return 'Lluvia';
      case 'snow':
        return 'Nieve';
      case 'storm':
        return 'Tormenta';
      case 'hail':
        return 'Granizo';
      case 'tornado':
        return 'Tornado';
      case 'earthquake':
        return 'Terremoto';
      default:
        return 'Evento Climático';
    }
  }
}
