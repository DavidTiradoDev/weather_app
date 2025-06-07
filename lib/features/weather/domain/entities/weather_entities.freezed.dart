// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherCurrent _$WeatherCurrentFromJson(Map<String, dynamic> json) {
  return _WeatherCurrent.fromJson(json);
}

/// @nodoc
mixin _$WeatherCurrent {
  String get location => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  String get conditions => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  double get humidity => throw _privateConstructorUsedError;
  double get windSpeed => throw _privateConstructorUsedError;
  double get pressure => throw _privateConstructorUsedError;
  DateTime get datetime => throw _privateConstructorUsedError;
  double get feelsLike => throw _privateConstructorUsedError;
  double get uvIndex => throw _privateConstructorUsedError;
  double get visibility => throw _privateConstructorUsedError;

  /// Serializes this WeatherCurrent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherCurrent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherCurrentCopyWith<WeatherCurrent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCurrentCopyWith<$Res> {
  factory $WeatherCurrentCopyWith(
          WeatherCurrent value, $Res Function(WeatherCurrent) then) =
      _$WeatherCurrentCopyWithImpl<$Res, WeatherCurrent>;
  @useResult
  $Res call(
      {String location,
      double temperature,
      String conditions,
      String icon,
      double humidity,
      double windSpeed,
      double pressure,
      DateTime datetime,
      double feelsLike,
      double uvIndex,
      double visibility});
}

/// @nodoc
class _$WeatherCurrentCopyWithImpl<$Res, $Val extends WeatherCurrent>
    implements $WeatherCurrentCopyWith<$Res> {
  _$WeatherCurrentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherCurrent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? temperature = null,
    Object? conditions = null,
    Object? icon = null,
    Object? humidity = null,
    Object? windSpeed = null,
    Object? pressure = null,
    Object? datetime = null,
    Object? feelsLike = null,
    Object? uvIndex = null,
    Object? visibility = null,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      feelsLike: null == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double,
      uvIndex: null == uvIndex
          ? _value.uvIndex
          : uvIndex // ignore: cast_nullable_to_non_nullable
              as double,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherCurrentImplCopyWith<$Res>
    implements $WeatherCurrentCopyWith<$Res> {
  factory _$$WeatherCurrentImplCopyWith(_$WeatherCurrentImpl value,
          $Res Function(_$WeatherCurrentImpl) then) =
      __$$WeatherCurrentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String location,
      double temperature,
      String conditions,
      String icon,
      double humidity,
      double windSpeed,
      double pressure,
      DateTime datetime,
      double feelsLike,
      double uvIndex,
      double visibility});
}

/// @nodoc
class __$$WeatherCurrentImplCopyWithImpl<$Res>
    extends _$WeatherCurrentCopyWithImpl<$Res, _$WeatherCurrentImpl>
    implements _$$WeatherCurrentImplCopyWith<$Res> {
  __$$WeatherCurrentImplCopyWithImpl(
      _$WeatherCurrentImpl _value, $Res Function(_$WeatherCurrentImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherCurrent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? temperature = null,
    Object? conditions = null,
    Object? icon = null,
    Object? humidity = null,
    Object? windSpeed = null,
    Object? pressure = null,
    Object? datetime = null,
    Object? feelsLike = null,
    Object? uvIndex = null,
    Object? visibility = null,
  }) {
    return _then(_$WeatherCurrentImpl(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      feelsLike: null == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double,
      uvIndex: null == uvIndex
          ? _value.uvIndex
          : uvIndex // ignore: cast_nullable_to_non_nullable
              as double,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherCurrentImpl implements _WeatherCurrent {
  const _$WeatherCurrentImpl(
      {required this.location,
      required this.temperature,
      required this.conditions,
      required this.icon,
      required this.humidity,
      required this.windSpeed,
      required this.pressure,
      required this.datetime,
      required this.feelsLike,
      required this.uvIndex,
      required this.visibility});

  factory _$WeatherCurrentImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherCurrentImplFromJson(json);

  @override
  final String location;
  @override
  final double temperature;
  @override
  final String conditions;
  @override
  final String icon;
  @override
  final double humidity;
  @override
  final double windSpeed;
  @override
  final double pressure;
  @override
  final DateTime datetime;
  @override
  final double feelsLike;
  @override
  final double uvIndex;
  @override
  final double visibility;

  @override
  String toString() {
    return 'WeatherCurrent(location: $location, temperature: $temperature, conditions: $conditions, icon: $icon, humidity: $humidity, windSpeed: $windSpeed, pressure: $pressure, datetime: $datetime, feelsLike: $feelsLike, uvIndex: $uvIndex, visibility: $visibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherCurrentImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.conditions, conditions) ||
                other.conditions == conditions) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.feelsLike, feelsLike) ||
                other.feelsLike == feelsLike) &&
            (identical(other.uvIndex, uvIndex) || other.uvIndex == uvIndex) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      location,
      temperature,
      conditions,
      icon,
      humidity,
      windSpeed,
      pressure,
      datetime,
      feelsLike,
      uvIndex,
      visibility);

  /// Create a copy of WeatherCurrent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherCurrentImplCopyWith<_$WeatherCurrentImpl> get copyWith =>
      __$$WeatherCurrentImplCopyWithImpl<_$WeatherCurrentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherCurrentImplToJson(
      this,
    );
  }
}

abstract class _WeatherCurrent implements WeatherCurrent {
  const factory _WeatherCurrent(
      {required final String location,
      required final double temperature,
      required final String conditions,
      required final String icon,
      required final double humidity,
      required final double windSpeed,
      required final double pressure,
      required final DateTime datetime,
      required final double feelsLike,
      required final double uvIndex,
      required final double visibility}) = _$WeatherCurrentImpl;

  factory _WeatherCurrent.fromJson(Map<String, dynamic> json) =
      _$WeatherCurrentImpl.fromJson;

  @override
  String get location;
  @override
  double get temperature;
  @override
  String get conditions;
  @override
  String get icon;
  @override
  double get humidity;
  @override
  double get windSpeed;
  @override
  double get pressure;
  @override
  DateTime get datetime;
  @override
  double get feelsLike;
  @override
  double get uvIndex;
  @override
  double get visibility;

  /// Create a copy of WeatherCurrent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherCurrentImplCopyWith<_$WeatherCurrentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherForecast _$WeatherForecastFromJson(Map<String, dynamic> json) {
  return _WeatherForecast.fromJson(json);
}

/// @nodoc
mixin _$WeatherForecast {
  String get location => throw _privateConstructorUsedError;
  List<WeatherDay> get days => throw _privateConstructorUsedError;

  /// Serializes this WeatherForecast to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherForecastCopyWith<WeatherForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastCopyWith<$Res> {
  factory $WeatherForecastCopyWith(
          WeatherForecast value, $Res Function(WeatherForecast) then) =
      _$WeatherForecastCopyWithImpl<$Res, WeatherForecast>;
  @useResult
  $Res call({String location, List<WeatherDay> days});
}

/// @nodoc
class _$WeatherForecastCopyWithImpl<$Res, $Val extends WeatherForecast>
    implements $WeatherForecastCopyWith<$Res> {
  _$WeatherForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? days = null,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<WeatherDay>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherForecastImplCopyWith<$Res>
    implements $WeatherForecastCopyWith<$Res> {
  factory _$$WeatherForecastImplCopyWith(_$WeatherForecastImpl value,
          $Res Function(_$WeatherForecastImpl) then) =
      __$$WeatherForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String location, List<WeatherDay> days});
}

/// @nodoc
class __$$WeatherForecastImplCopyWithImpl<$Res>
    extends _$WeatherForecastCopyWithImpl<$Res, _$WeatherForecastImpl>
    implements _$$WeatherForecastImplCopyWith<$Res> {
  __$$WeatherForecastImplCopyWithImpl(
      _$WeatherForecastImpl _value, $Res Function(_$WeatherForecastImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? days = null,
  }) {
    return _then(_$WeatherForecastImpl(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<WeatherDay>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherForecastImpl implements _WeatherForecast {
  const _$WeatherForecastImpl(
      {required this.location, required final List<WeatherDay> days})
      : _days = days;

  factory _$WeatherForecastImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherForecastImplFromJson(json);

  @override
  final String location;
  final List<WeatherDay> _days;
  @override
  List<WeatherDay> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'WeatherForecast(location: $location, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherForecastImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, location, const DeepCollectionEquality().hash(_days));

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherForecastImplCopyWith<_$WeatherForecastImpl> get copyWith =>
      __$$WeatherForecastImplCopyWithImpl<_$WeatherForecastImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherForecastImplToJson(
      this,
    );
  }
}

abstract class _WeatherForecast implements WeatherForecast {
  const factory _WeatherForecast(
      {required final String location,
      required final List<WeatherDay> days}) = _$WeatherForecastImpl;

  factory _WeatherForecast.fromJson(Map<String, dynamic> json) =
      _$WeatherForecastImpl.fromJson;

  @override
  String get location;
  @override
  List<WeatherDay> get days;

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherForecastImplCopyWith<_$WeatherForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherDay _$WeatherDayFromJson(Map<String, dynamic> json) {
  return _WeatherDay.fromJson(json);
}

/// @nodoc
mixin _$WeatherDay {
  DateTime get date => throw _privateConstructorUsedError;
  double get tempMax => throw _privateConstructorUsedError;
  double get tempMin => throw _privateConstructorUsedError;
  String get conditions => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  double get humidity => throw _privateConstructorUsedError;
  double get windSpeed => throw _privateConstructorUsedError;
  double get precipitationProbability => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this WeatherDay to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherDayCopyWith<WeatherDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDayCopyWith<$Res> {
  factory $WeatherDayCopyWith(
          WeatherDay value, $Res Function(WeatherDay) then) =
      _$WeatherDayCopyWithImpl<$Res, WeatherDay>;
  @useResult
  $Res call(
      {DateTime date,
      double tempMax,
      double tempMin,
      String conditions,
      String icon,
      double humidity,
      double windSpeed,
      double precipitationProbability,
      String description});
}

/// @nodoc
class _$WeatherDayCopyWithImpl<$Res, $Val extends WeatherDay>
    implements $WeatherDayCopyWith<$Res> {
  _$WeatherDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? tempMax = null,
    Object? tempMin = null,
    Object? conditions = null,
    Object? icon = null,
    Object? humidity = null,
    Object? windSpeed = null,
    Object? precipitationProbability = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tempMax: null == tempMax
          ? _value.tempMax
          : tempMax // ignore: cast_nullable_to_non_nullable
              as double,
      tempMin: null == tempMin
          ? _value.tempMin
          : tempMin // ignore: cast_nullable_to_non_nullable
              as double,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      precipitationProbability: null == precipitationProbability
          ? _value.precipitationProbability
          : precipitationProbability // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherDayImplCopyWith<$Res>
    implements $WeatherDayCopyWith<$Res> {
  factory _$$WeatherDayImplCopyWith(
          _$WeatherDayImpl value, $Res Function(_$WeatherDayImpl) then) =
      __$$WeatherDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      double tempMax,
      double tempMin,
      String conditions,
      String icon,
      double humidity,
      double windSpeed,
      double precipitationProbability,
      String description});
}

/// @nodoc
class __$$WeatherDayImplCopyWithImpl<$Res>
    extends _$WeatherDayCopyWithImpl<$Res, _$WeatherDayImpl>
    implements _$$WeatherDayImplCopyWith<$Res> {
  __$$WeatherDayImplCopyWithImpl(
      _$WeatherDayImpl _value, $Res Function(_$WeatherDayImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? tempMax = null,
    Object? tempMin = null,
    Object? conditions = null,
    Object? icon = null,
    Object? humidity = null,
    Object? windSpeed = null,
    Object? precipitationProbability = null,
    Object? description = null,
  }) {
    return _then(_$WeatherDayImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tempMax: null == tempMax
          ? _value.tempMax
          : tempMax // ignore: cast_nullable_to_non_nullable
              as double,
      tempMin: null == tempMin
          ? _value.tempMin
          : tempMin // ignore: cast_nullable_to_non_nullable
              as double,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      precipitationProbability: null == precipitationProbability
          ? _value.precipitationProbability
          : precipitationProbability // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherDayImpl implements _WeatherDay {
  const _$WeatherDayImpl(
      {required this.date,
      required this.tempMax,
      required this.tempMin,
      required this.conditions,
      required this.icon,
      required this.humidity,
      required this.windSpeed,
      required this.precipitationProbability,
      required this.description});

  factory _$WeatherDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherDayImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double tempMax;
  @override
  final double tempMin;
  @override
  final String conditions;
  @override
  final String icon;
  @override
  final double humidity;
  @override
  final double windSpeed;
  @override
  final double precipitationProbability;
  @override
  final String description;

  @override
  String toString() {
    return 'WeatherDay(date: $date, tempMax: $tempMax, tempMin: $tempMin, conditions: $conditions, icon: $icon, humidity: $humidity, windSpeed: $windSpeed, precipitationProbability: $precipitationProbability, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDayImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.tempMax, tempMax) || other.tempMax == tempMax) &&
            (identical(other.tempMin, tempMin) || other.tempMin == tempMin) &&
            (identical(other.conditions, conditions) ||
                other.conditions == conditions) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(
                    other.precipitationProbability, precipitationProbability) ||
                other.precipitationProbability == precipitationProbability) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      tempMax,
      tempMin,
      conditions,
      icon,
      humidity,
      windSpeed,
      precipitationProbability,
      description);

  /// Create a copy of WeatherDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDayImplCopyWith<_$WeatherDayImpl> get copyWith =>
      __$$WeatherDayImplCopyWithImpl<_$WeatherDayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherDayImplToJson(
      this,
    );
  }
}

abstract class _WeatherDay implements WeatherDay {
  const factory _WeatherDay(
      {required final DateTime date,
      required final double tempMax,
      required final double tempMin,
      required final String conditions,
      required final String icon,
      required final double humidity,
      required final double windSpeed,
      required final double precipitationProbability,
      required final String description}) = _$WeatherDayImpl;

  factory _WeatherDay.fromJson(Map<String, dynamic> json) =
      _$WeatherDayImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get tempMax;
  @override
  double get tempMin;
  @override
  String get conditions;
  @override
  String get icon;
  @override
  double get humidity;
  @override
  double get windSpeed;
  @override
  double get precipitationProbability;
  @override
  String get description;

  /// Create a copy of WeatherDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherDayImplCopyWith<_$WeatherDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherEvent _$WeatherEventFromJson(Map<String, dynamic> json) {
  return _WeatherEvent.fromJson(json);
}

/// @nodoc
mixin _$WeatherEvent {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  String get severity => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;

  /// Serializes this WeatherEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherEventCopyWith<WeatherEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherEventCopyWith<$Res> {
  factory $WeatherEventCopyWith(
          WeatherEvent value, $Res Function(WeatherEvent) then) =
      _$WeatherEventCopyWithImpl<$Res, WeatherEvent>;
  @useResult
  $Res call(
      {String id,
      String type,
      String title,
      String description,
      DateTime startTime,
      DateTime? endTime,
      String severity,
      double latitude,
      double longitude,
      bool isFavorite});
}

/// @nodoc
class _$WeatherEventCopyWithImpl<$Res, $Val extends WeatherEvent>
    implements $WeatherEventCopyWith<$Res> {
  _$WeatherEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? severity = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? isFavorite = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherEventImplCopyWith<$Res>
    implements $WeatherEventCopyWith<$Res> {
  factory _$$WeatherEventImplCopyWith(
          _$WeatherEventImpl value, $Res Function(_$WeatherEventImpl) then) =
      __$$WeatherEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String title,
      String description,
      DateTime startTime,
      DateTime? endTime,
      String severity,
      double latitude,
      double longitude,
      bool isFavorite});
}

/// @nodoc
class __$$WeatherEventImplCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res, _$WeatherEventImpl>
    implements _$$WeatherEventImplCopyWith<$Res> {
  __$$WeatherEventImplCopyWithImpl(
      _$WeatherEventImpl _value, $Res Function(_$WeatherEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? severity = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? isFavorite = null,
  }) {
    return _then(_$WeatherEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherEventImpl implements _WeatherEvent {
  const _$WeatherEventImpl(
      {required this.id,
      required this.type,
      required this.title,
      required this.description,
      required this.startTime,
      required this.endTime,
      required this.severity,
      required this.latitude,
      required this.longitude,
      this.isFavorite = false});

  factory _$WeatherEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherEventImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime startTime;
  @override
  final DateTime? endTime;
  @override
  final String severity;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  @JsonKey()
  final bool isFavorite;

  @override
  String toString() {
    return 'WeatherEvent(id: $id, type: $type, title: $title, description: $description, startTime: $startTime, endTime: $endTime, severity: $severity, latitude: $latitude, longitude: $longitude, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, title, description,
      startTime, endTime, severity, latitude, longitude, isFavorite);

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherEventImplCopyWith<_$WeatherEventImpl> get copyWith =>
      __$$WeatherEventImplCopyWithImpl<_$WeatherEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherEventImplToJson(
      this,
    );
  }
}

abstract class _WeatherEvent implements WeatherEvent {
  const factory _WeatherEvent(
      {required final String id,
      required final String type,
      required final String title,
      required final String description,
      required final DateTime startTime,
      required final DateTime? endTime,
      required final String severity,
      required final double latitude,
      required final double longitude,
      final bool isFavorite}) = _$WeatherEventImpl;

  factory _WeatherEvent.fromJson(Map<String, dynamic> json) =
      _$WeatherEventImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get startTime;
  @override
  DateTime? get endTime;
  @override
  String get severity;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  bool get isFavorite;

  /// Create a copy of WeatherEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherEventImplCopyWith<_$WeatherEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationInfo _$LocationInfoFromJson(Map<String, dynamic> json) {
  return _LocationInfo.fromJson(json);
}

/// @nodoc
mixin _$LocationInfo {
  String get name => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  /// Serializes this LocationInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationInfoCopyWith<LocationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationInfoCopyWith<$Res> {
  factory $LocationInfoCopyWith(
          LocationInfo value, $Res Function(LocationInfo) then) =
      _$LocationInfoCopyWithImpl<$Res, LocationInfo>;
  @useResult
  $Res call(
      {String name,
      String country,
      String region,
      double latitude,
      double longitude});
}

/// @nodoc
class _$LocationInfoCopyWithImpl<$Res, $Val extends LocationInfo>
    implements $LocationInfoCopyWith<$Res> {
  _$LocationInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? country = null,
    Object? region = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationInfoImplCopyWith<$Res>
    implements $LocationInfoCopyWith<$Res> {
  factory _$$LocationInfoImplCopyWith(
          _$LocationInfoImpl value, $Res Function(_$LocationInfoImpl) then) =
      __$$LocationInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String country,
      String region,
      double latitude,
      double longitude});
}

/// @nodoc
class __$$LocationInfoImplCopyWithImpl<$Res>
    extends _$LocationInfoCopyWithImpl<$Res, _$LocationInfoImpl>
    implements _$$LocationInfoImplCopyWith<$Res> {
  __$$LocationInfoImplCopyWithImpl(
      _$LocationInfoImpl _value, $Res Function(_$LocationInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? country = null,
    Object? region = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$LocationInfoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationInfoImpl implements _LocationInfo {
  const _$LocationInfoImpl(
      {required this.name,
      required this.country,
      required this.region,
      required this.latitude,
      required this.longitude});

  factory _$LocationInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationInfoImplFromJson(json);

  @override
  final String name;
  @override
  final String country;
  @override
  final String region;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'LocationInfo(name: $name, country: $country, region: $region, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, country, region, latitude, longitude);

  /// Create a copy of LocationInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationInfoImplCopyWith<_$LocationInfoImpl> get copyWith =>
      __$$LocationInfoImplCopyWithImpl<_$LocationInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationInfoImplToJson(
      this,
    );
  }
}

abstract class _LocationInfo implements LocationInfo {
  const factory _LocationInfo(
      {required final String name,
      required final String country,
      required final String region,
      required final double latitude,
      required final double longitude}) = _$LocationInfoImpl;

  factory _LocationInfo.fromJson(Map<String, dynamic> json) =
      _$LocationInfoImpl.fromJson;

  @override
  String get name;
  @override
  String get country;
  @override
  String get region;
  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of LocationInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationInfoImplCopyWith<_$LocationInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
