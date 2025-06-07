// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherResponseDtoImpl _$$WeatherResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherResponseDtoImpl(
      resolvedAddress: json['resolvedAddress'] as String,
      timezone: json['timezone'] as String?,
      currentConditions: json['currentConditions'] == null
          ? null
          : CurrentConditionsDto.fromJson(
              json['currentConditions'] as Map<String, dynamic>),
      days: (json['days'] as List<dynamic>?)
              ?.map((e) => DayDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$WeatherResponseDtoImplToJson(
        _$WeatherResponseDtoImpl instance) =>
    <String, dynamic>{
      'resolvedAddress': instance.resolvedAddress,
      'timezone': instance.timezone,
      'currentConditions': instance.currentConditions,
      'days': instance.days,
    };

_$CurrentConditionsDtoImpl _$$CurrentConditionsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrentConditionsDtoImpl(
      datetime: json['datetime'] as String,
      temp: (json['temp'] as num?)?.toDouble() ?? 0.0,
      feelslike: (json['feelslike'] as num?)?.toDouble() ?? 0.0,
      humidity: (json['humidity'] as num?)?.toDouble() ?? 0.0,
      windspeed: (json['windspeed'] as num?)?.toDouble() ?? 0.0,
      pressure: (json['pressure'] as num?)?.toDouble() ?? 0.0,
      uvindex: (json['uvindex'] as num?)?.toDouble() ?? 0.0,
      visibility: (json['visibility'] as num?)?.toDouble() ?? 0.0,
      conditions: json['conditions'] as String? ?? '',
      icon: json['icon'] as String? ?? 'clear-day',
    );

Map<String, dynamic> _$$CurrentConditionsDtoImplToJson(
        _$CurrentConditionsDtoImpl instance) =>
    <String, dynamic>{
      'datetime': instance.datetime,
      'temp': instance.temp,
      'feelslike': instance.feelslike,
      'humidity': instance.humidity,
      'windspeed': instance.windspeed,
      'pressure': instance.pressure,
      'uvindex': instance.uvindex,
      'visibility': instance.visibility,
      'conditions': instance.conditions,
      'icon': instance.icon,
    };

_$DayDtoImpl _$$DayDtoImplFromJson(Map<String, dynamic> json) => _$DayDtoImpl(
      datetime: json['datetime'] as String,
      tempmax: (json['tempmax'] as num?)?.toDouble() ?? 0.0,
      tempmin: (json['tempmin'] as num?)?.toDouble() ?? 0.0,
      humidity: (json['humidity'] as num?)?.toDouble() ?? 0.0,
      windspeed: (json['windspeed'] as num?)?.toDouble() ?? 0.0,
      precipprob: (json['precipprob'] as num?)?.toDouble() ?? 0.0,
      conditions: json['conditions'] as String? ?? '',
      description: json['description'] as String? ?? '',
      icon: json['icon'] as String? ?? 'clear-day',
    );

Map<String, dynamic> _$$DayDtoImplToJson(_$DayDtoImpl instance) =>
    <String, dynamic>{
      'datetime': instance.datetime,
      'tempmax': instance.tempmax,
      'tempmin': instance.tempmin,
      'humidity': instance.humidity,
      'windspeed': instance.windspeed,
      'precipprob': instance.precipprob,
      'conditions': instance.conditions,
      'description': instance.description,
      'icon': instance.icon,
    };

_$WeatherEventsResponseDtoImpl _$$WeatherEventsResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherEventsResponseDtoImpl(
      resolvedAddress: json['resolvedAddress'] as String,
      events: (json['events'] as List<dynamic>?)
              ?.map((e) => EventDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$WeatherEventsResponseDtoImplToJson(
        _$WeatherEventsResponseDtoImpl instance) =>
    <String, dynamic>{
      'resolvedAddress': instance.resolvedAddress,
      'events': instance.events,
    };

_$EventDtoImpl _$$EventDtoImplFromJson(Map<String, dynamic> json) =>
    _$EventDtoImpl(
      type: json['type'] as String? ?? '',
      datetime: json['datetime'] as String? ?? '',
      endtime: json['endtime'] as String?,
      severity: json['severity'] as String? ?? 'minor',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$EventDtoImplToJson(_$EventDtoImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'datetime': instance.datetime,
      'endtime': instance.endtime,
      'severity': instance.severity,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'description': instance.description,
    };
