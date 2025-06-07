// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherCurrentImpl _$$WeatherCurrentImplFromJson(Map<String, dynamic> json) =>
    _$WeatherCurrentImpl(
      location: json['location'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      conditions: json['conditions'] as String,
      icon: json['icon'] as String,
      humidity: (json['humidity'] as num).toDouble(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
      pressure: (json['pressure'] as num).toDouble(),
      datetime: DateTime.parse(json['datetime'] as String),
      feelsLike: (json['feelsLike'] as num).toDouble(),
      uvIndex: (json['uvIndex'] as num).toDouble(),
      visibility: (json['visibility'] as num).toDouble(),
    );

Map<String, dynamic> _$$WeatherCurrentImplToJson(
        _$WeatherCurrentImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
      'temperature': instance.temperature,
      'conditions': instance.conditions,
      'icon': instance.icon,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
      'pressure': instance.pressure,
      'datetime': instance.datetime.toIso8601String(),
      'feelsLike': instance.feelsLike,
      'uvIndex': instance.uvIndex,
      'visibility': instance.visibility,
    };

_$WeatherForecastImpl _$$WeatherForecastImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherForecastImpl(
      location: json['location'] as String,
      days: (json['days'] as List<dynamic>)
          .map((e) => WeatherDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WeatherForecastImplToJson(
        _$WeatherForecastImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
      'days': instance.days,
    };

_$WeatherDayImpl _$$WeatherDayImplFromJson(Map<String, dynamic> json) =>
    _$WeatherDayImpl(
      date: DateTime.parse(json['date'] as String),
      tempMax: (json['tempMax'] as num).toDouble(),
      tempMin: (json['tempMin'] as num).toDouble(),
      conditions: json['conditions'] as String,
      icon: json['icon'] as String,
      humidity: (json['humidity'] as num).toDouble(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
      precipitationProbability:
          (json['precipitationProbability'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$WeatherDayImplToJson(_$WeatherDayImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'tempMax': instance.tempMax,
      'tempMin': instance.tempMin,
      'conditions': instance.conditions,
      'icon': instance.icon,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
      'precipitationProbability': instance.precipitationProbability,
      'description': instance.description,
    };

_$WeatherEventImpl _$$WeatherEventImplFromJson(Map<String, dynamic> json) =>
    _$WeatherEventImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      severity: json['severity'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$WeatherEventImplToJson(_$WeatherEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'severity': instance.severity,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'isFavorite': instance.isFavorite,
    };

_$LocationInfoImpl _$$LocationInfoImplFromJson(Map<String, dynamic> json) =>
    _$LocationInfoImpl(
      name: json['name'] as String,
      country: json['country'] as String,
      region: json['region'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$LocationInfoImplToJson(_$LocationInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'region': instance.region,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
