// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherResponseDto _$WeatherResponseDtoFromJson(Map<String, dynamic> json) {
  return _WeatherResponseDto.fromJson(json);
}

/// @nodoc
mixin _$WeatherResponseDto {
  String get resolvedAddress => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;
  CurrentConditionsDto? get currentConditions =>
      throw _privateConstructorUsedError;
  List<DayDto> get days => throw _privateConstructorUsedError;

  /// Serializes this WeatherResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherResponseDtoCopyWith<WeatherResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherResponseDtoCopyWith<$Res> {
  factory $WeatherResponseDtoCopyWith(
          WeatherResponseDto value, $Res Function(WeatherResponseDto) then) =
      _$WeatherResponseDtoCopyWithImpl<$Res, WeatherResponseDto>;
  @useResult
  $Res call(
      {String resolvedAddress,
      String? timezone,
      CurrentConditionsDto? currentConditions,
      List<DayDto> days});

  $CurrentConditionsDtoCopyWith<$Res>? get currentConditions;
}

/// @nodoc
class _$WeatherResponseDtoCopyWithImpl<$Res, $Val extends WeatherResponseDto>
    implements $WeatherResponseDtoCopyWith<$Res> {
  _$WeatherResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resolvedAddress = null,
    Object? timezone = freezed,
    Object? currentConditions = freezed,
    Object? days = null,
  }) {
    return _then(_value.copyWith(
      resolvedAddress: null == resolvedAddress
          ? _value.resolvedAddress
          : resolvedAddress // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      currentConditions: freezed == currentConditions
          ? _value.currentConditions
          : currentConditions // ignore: cast_nullable_to_non_nullable
              as CurrentConditionsDto?,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayDto>,
    ) as $Val);
  }

  /// Create a copy of WeatherResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrentConditionsDtoCopyWith<$Res>? get currentConditions {
    if (_value.currentConditions == null) {
      return null;
    }

    return $CurrentConditionsDtoCopyWith<$Res>(_value.currentConditions!,
        (value) {
      return _then(_value.copyWith(currentConditions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherResponseDtoImplCopyWith<$Res>
    implements $WeatherResponseDtoCopyWith<$Res> {
  factory _$$WeatherResponseDtoImplCopyWith(_$WeatherResponseDtoImpl value,
          $Res Function(_$WeatherResponseDtoImpl) then) =
      __$$WeatherResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String resolvedAddress,
      String? timezone,
      CurrentConditionsDto? currentConditions,
      List<DayDto> days});

  @override
  $CurrentConditionsDtoCopyWith<$Res>? get currentConditions;
}

/// @nodoc
class __$$WeatherResponseDtoImplCopyWithImpl<$Res>
    extends _$WeatherResponseDtoCopyWithImpl<$Res, _$WeatherResponseDtoImpl>
    implements _$$WeatherResponseDtoImplCopyWith<$Res> {
  __$$WeatherResponseDtoImplCopyWithImpl(_$WeatherResponseDtoImpl _value,
      $Res Function(_$WeatherResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resolvedAddress = null,
    Object? timezone = freezed,
    Object? currentConditions = freezed,
    Object? days = null,
  }) {
    return _then(_$WeatherResponseDtoImpl(
      resolvedAddress: null == resolvedAddress
          ? _value.resolvedAddress
          : resolvedAddress // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      currentConditions: freezed == currentConditions
          ? _value.currentConditions
          : currentConditions // ignore: cast_nullable_to_non_nullable
              as CurrentConditionsDto?,
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherResponseDtoImpl implements _WeatherResponseDto {
  const _$WeatherResponseDtoImpl(
      {required this.resolvedAddress,
      this.timezone,
      this.currentConditions,
      final List<DayDto> days = const []})
      : _days = days;

  factory _$WeatherResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherResponseDtoImplFromJson(json);

  @override
  final String resolvedAddress;
  @override
  final String? timezone;
  @override
  final CurrentConditionsDto? currentConditions;
  final List<DayDto> _days;
  @override
  @JsonKey()
  List<DayDto> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'WeatherResponseDto(resolvedAddress: $resolvedAddress, timezone: $timezone, currentConditions: $currentConditions, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherResponseDtoImpl &&
            (identical(other.resolvedAddress, resolvedAddress) ||
                other.resolvedAddress == resolvedAddress) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.currentConditions, currentConditions) ||
                other.currentConditions == currentConditions) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, resolvedAddress, timezone,
      currentConditions, const DeepCollectionEquality().hash(_days));

  /// Create a copy of WeatherResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherResponseDtoImplCopyWith<_$WeatherResponseDtoImpl> get copyWith =>
      __$$WeatherResponseDtoImplCopyWithImpl<_$WeatherResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _WeatherResponseDto implements WeatherResponseDto {
  const factory _WeatherResponseDto(
      {required final String resolvedAddress,
      final String? timezone,
      final CurrentConditionsDto? currentConditions,
      final List<DayDto> days}) = _$WeatherResponseDtoImpl;

  factory _WeatherResponseDto.fromJson(Map<String, dynamic> json) =
      _$WeatherResponseDtoImpl.fromJson;

  @override
  String get resolvedAddress;
  @override
  String? get timezone;
  @override
  CurrentConditionsDto? get currentConditions;
  @override
  List<DayDto> get days;

  /// Create a copy of WeatherResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherResponseDtoImplCopyWith<_$WeatherResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CurrentConditionsDto _$CurrentConditionsDtoFromJson(Map<String, dynamic> json) {
  return _CurrentConditionsDto.fromJson(json);
}

/// @nodoc
mixin _$CurrentConditionsDto {
  String get datetime => throw _privateConstructorUsedError;
  double get temp => throw _privateConstructorUsedError;
  double get feelslike => throw _privateConstructorUsedError;
  double get humidity => throw _privateConstructorUsedError;
  double get windspeed => throw _privateConstructorUsedError;
  double get pressure => throw _privateConstructorUsedError;
  double get uvindex => throw _privateConstructorUsedError;
  double get visibility => throw _privateConstructorUsedError;
  String get conditions => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  /// Serializes this CurrentConditionsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrentConditionsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrentConditionsDtoCopyWith<CurrentConditionsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentConditionsDtoCopyWith<$Res> {
  factory $CurrentConditionsDtoCopyWith(CurrentConditionsDto value,
          $Res Function(CurrentConditionsDto) then) =
      _$CurrentConditionsDtoCopyWithImpl<$Res, CurrentConditionsDto>;
  @useResult
  $Res call(
      {String datetime,
      double temp,
      double feelslike,
      double humidity,
      double windspeed,
      double pressure,
      double uvindex,
      double visibility,
      String conditions,
      String icon});
}

/// @nodoc
class _$CurrentConditionsDtoCopyWithImpl<$Res,
        $Val extends CurrentConditionsDto>
    implements $CurrentConditionsDtoCopyWith<$Res> {
  _$CurrentConditionsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrentConditionsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datetime = null,
    Object? temp = null,
    Object? feelslike = null,
    Object? humidity = null,
    Object? windspeed = null,
    Object? pressure = null,
    Object? uvindex = null,
    Object? visibility = null,
    Object? conditions = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double,
      feelslike: null == feelslike
          ? _value.feelslike
          : feelslike // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      windspeed: null == windspeed
          ? _value.windspeed
          : windspeed // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double,
      uvindex: null == uvindex
          ? _value.uvindex
          : uvindex // ignore: cast_nullable_to_non_nullable
              as double,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as double,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentConditionsDtoImplCopyWith<$Res>
    implements $CurrentConditionsDtoCopyWith<$Res> {
  factory _$$CurrentConditionsDtoImplCopyWith(_$CurrentConditionsDtoImpl value,
          $Res Function(_$CurrentConditionsDtoImpl) then) =
      __$$CurrentConditionsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String datetime,
      double temp,
      double feelslike,
      double humidity,
      double windspeed,
      double pressure,
      double uvindex,
      double visibility,
      String conditions,
      String icon});
}

/// @nodoc
class __$$CurrentConditionsDtoImplCopyWithImpl<$Res>
    extends _$CurrentConditionsDtoCopyWithImpl<$Res, _$CurrentConditionsDtoImpl>
    implements _$$CurrentConditionsDtoImplCopyWith<$Res> {
  __$$CurrentConditionsDtoImplCopyWithImpl(_$CurrentConditionsDtoImpl _value,
      $Res Function(_$CurrentConditionsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrentConditionsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datetime = null,
    Object? temp = null,
    Object? feelslike = null,
    Object? humidity = null,
    Object? windspeed = null,
    Object? pressure = null,
    Object? uvindex = null,
    Object? visibility = null,
    Object? conditions = null,
    Object? icon = null,
  }) {
    return _then(_$CurrentConditionsDtoImpl(
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double,
      feelslike: null == feelslike
          ? _value.feelslike
          : feelslike // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      windspeed: null == windspeed
          ? _value.windspeed
          : windspeed // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double,
      uvindex: null == uvindex
          ? _value.uvindex
          : uvindex // ignore: cast_nullable_to_non_nullable
              as double,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as double,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrentConditionsDtoImpl implements _CurrentConditionsDto {
  const _$CurrentConditionsDtoImpl(
      {required this.datetime,
      this.temp = 0.0,
      this.feelslike = 0.0,
      this.humidity = 0.0,
      this.windspeed = 0.0,
      this.pressure = 0.0,
      this.uvindex = 0.0,
      this.visibility = 0.0,
      this.conditions = '',
      this.icon = 'clear-day'});

  factory _$CurrentConditionsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentConditionsDtoImplFromJson(json);

  @override
  final String datetime;
  @override
  @JsonKey()
  final double temp;
  @override
  @JsonKey()
  final double feelslike;
  @override
  @JsonKey()
  final double humidity;
  @override
  @JsonKey()
  final double windspeed;
  @override
  @JsonKey()
  final double pressure;
  @override
  @JsonKey()
  final double uvindex;
  @override
  @JsonKey()
  final double visibility;
  @override
  @JsonKey()
  final String conditions;
  @override
  @JsonKey()
  final String icon;

  @override
  String toString() {
    return 'CurrentConditionsDto(datetime: $datetime, temp: $temp, feelslike: $feelslike, humidity: $humidity, windspeed: $windspeed, pressure: $pressure, uvindex: $uvindex, visibility: $visibility, conditions: $conditions, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentConditionsDtoImpl &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.feelslike, feelslike) ||
                other.feelslike == feelslike) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.windspeed, windspeed) ||
                other.windspeed == windspeed) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure) &&
            (identical(other.uvindex, uvindex) || other.uvindex == uvindex) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.conditions, conditions) ||
                other.conditions == conditions) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, datetime, temp, feelslike,
      humidity, windspeed, pressure, uvindex, visibility, conditions, icon);

  /// Create a copy of CurrentConditionsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentConditionsDtoImplCopyWith<_$CurrentConditionsDtoImpl>
      get copyWith =>
          __$$CurrentConditionsDtoImplCopyWithImpl<_$CurrentConditionsDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentConditionsDtoImplToJson(
      this,
    );
  }
}

abstract class _CurrentConditionsDto implements CurrentConditionsDto {
  const factory _CurrentConditionsDto(
      {required final String datetime,
      final double temp,
      final double feelslike,
      final double humidity,
      final double windspeed,
      final double pressure,
      final double uvindex,
      final double visibility,
      final String conditions,
      final String icon}) = _$CurrentConditionsDtoImpl;

  factory _CurrentConditionsDto.fromJson(Map<String, dynamic> json) =
      _$CurrentConditionsDtoImpl.fromJson;

  @override
  String get datetime;
  @override
  double get temp;
  @override
  double get feelslike;
  @override
  double get humidity;
  @override
  double get windspeed;
  @override
  double get pressure;
  @override
  double get uvindex;
  @override
  double get visibility;
  @override
  String get conditions;
  @override
  String get icon;

  /// Create a copy of CurrentConditionsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentConditionsDtoImplCopyWith<_$CurrentConditionsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DayDto _$DayDtoFromJson(Map<String, dynamic> json) {
  return _DayDto.fromJson(json);
}

/// @nodoc
mixin _$DayDto {
  String get datetime => throw _privateConstructorUsedError;
  double get tempmax => throw _privateConstructorUsedError;
  double get tempmin => throw _privateConstructorUsedError;
  double get humidity => throw _privateConstructorUsedError;
  double get windspeed => throw _privateConstructorUsedError;
  double get precipprob => throw _privateConstructorUsedError;
  String get conditions => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  /// Serializes this DayDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DayDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DayDtoCopyWith<DayDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayDtoCopyWith<$Res> {
  factory $DayDtoCopyWith(DayDto value, $Res Function(DayDto) then) =
      _$DayDtoCopyWithImpl<$Res, DayDto>;
  @useResult
  $Res call(
      {String datetime,
      double tempmax,
      double tempmin,
      double humidity,
      double windspeed,
      double precipprob,
      String conditions,
      String description,
      String icon});
}

/// @nodoc
class _$DayDtoCopyWithImpl<$Res, $Val extends DayDto>
    implements $DayDtoCopyWith<$Res> {
  _$DayDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DayDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datetime = null,
    Object? tempmax = null,
    Object? tempmin = null,
    Object? humidity = null,
    Object? windspeed = null,
    Object? precipprob = null,
    Object? conditions = null,
    Object? description = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
      tempmax: null == tempmax
          ? _value.tempmax
          : tempmax // ignore: cast_nullable_to_non_nullable
              as double,
      tempmin: null == tempmin
          ? _value.tempmin
          : tempmin // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      windspeed: null == windspeed
          ? _value.windspeed
          : windspeed // ignore: cast_nullable_to_non_nullable
              as double,
      precipprob: null == precipprob
          ? _value.precipprob
          : precipprob // ignore: cast_nullable_to_non_nullable
              as double,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DayDtoImplCopyWith<$Res> implements $DayDtoCopyWith<$Res> {
  factory _$$DayDtoImplCopyWith(
          _$DayDtoImpl value, $Res Function(_$DayDtoImpl) then) =
      __$$DayDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String datetime,
      double tempmax,
      double tempmin,
      double humidity,
      double windspeed,
      double precipprob,
      String conditions,
      String description,
      String icon});
}

/// @nodoc
class __$$DayDtoImplCopyWithImpl<$Res>
    extends _$DayDtoCopyWithImpl<$Res, _$DayDtoImpl>
    implements _$$DayDtoImplCopyWith<$Res> {
  __$$DayDtoImplCopyWithImpl(
      _$DayDtoImpl _value, $Res Function(_$DayDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DayDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datetime = null,
    Object? tempmax = null,
    Object? tempmin = null,
    Object? humidity = null,
    Object? windspeed = null,
    Object? precipprob = null,
    Object? conditions = null,
    Object? description = null,
    Object? icon = null,
  }) {
    return _then(_$DayDtoImpl(
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
      tempmax: null == tempmax
          ? _value.tempmax
          : tempmax // ignore: cast_nullable_to_non_nullable
              as double,
      tempmin: null == tempmin
          ? _value.tempmin
          : tempmin // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      windspeed: null == windspeed
          ? _value.windspeed
          : windspeed // ignore: cast_nullable_to_non_nullable
              as double,
      precipprob: null == precipprob
          ? _value.precipprob
          : precipprob // ignore: cast_nullable_to_non_nullable
              as double,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DayDtoImpl implements _DayDto {
  const _$DayDtoImpl(
      {required this.datetime,
      this.tempmax = 0.0,
      this.tempmin = 0.0,
      this.humidity = 0.0,
      this.windspeed = 0.0,
      this.precipprob = 0.0,
      this.conditions = '',
      this.description = '',
      this.icon = 'clear-day'});

  factory _$DayDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayDtoImplFromJson(json);

  @override
  final String datetime;
  @override
  @JsonKey()
  final double tempmax;
  @override
  @JsonKey()
  final double tempmin;
  @override
  @JsonKey()
  final double humidity;
  @override
  @JsonKey()
  final double windspeed;
  @override
  @JsonKey()
  final double precipprob;
  @override
  @JsonKey()
  final String conditions;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String icon;

  @override
  String toString() {
    return 'DayDto(datetime: $datetime, tempmax: $tempmax, tempmin: $tempmin, humidity: $humidity, windspeed: $windspeed, precipprob: $precipprob, conditions: $conditions, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayDtoImpl &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.tempmax, tempmax) || other.tempmax == tempmax) &&
            (identical(other.tempmin, tempmin) || other.tempmin == tempmin) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.windspeed, windspeed) ||
                other.windspeed == windspeed) &&
            (identical(other.precipprob, precipprob) ||
                other.precipprob == precipprob) &&
            (identical(other.conditions, conditions) ||
                other.conditions == conditions) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, datetime, tempmax, tempmin,
      humidity, windspeed, precipprob, conditions, description, icon);

  /// Create a copy of DayDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayDtoImplCopyWith<_$DayDtoImpl> get copyWith =>
      __$$DayDtoImplCopyWithImpl<_$DayDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DayDtoImplToJson(
      this,
    );
  }
}

abstract class _DayDto implements DayDto {
  const factory _DayDto(
      {required final String datetime,
      final double tempmax,
      final double tempmin,
      final double humidity,
      final double windspeed,
      final double precipprob,
      final String conditions,
      final String description,
      final String icon}) = _$DayDtoImpl;

  factory _DayDto.fromJson(Map<String, dynamic> json) = _$DayDtoImpl.fromJson;

  @override
  String get datetime;
  @override
  double get tempmax;
  @override
  double get tempmin;
  @override
  double get humidity;
  @override
  double get windspeed;
  @override
  double get precipprob;
  @override
  String get conditions;
  @override
  String get description;
  @override
  String get icon;

  /// Create a copy of DayDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayDtoImplCopyWith<_$DayDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherEventsResponseDto _$WeatherEventsResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _WeatherEventsResponseDto.fromJson(json);
}

/// @nodoc
mixin _$WeatherEventsResponseDto {
  String get resolvedAddress => throw _privateConstructorUsedError;
  List<EventDto> get events => throw _privateConstructorUsedError;

  /// Serializes this WeatherEventsResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherEventsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherEventsResponseDtoCopyWith<WeatherEventsResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherEventsResponseDtoCopyWith<$Res> {
  factory $WeatherEventsResponseDtoCopyWith(WeatherEventsResponseDto value,
          $Res Function(WeatherEventsResponseDto) then) =
      _$WeatherEventsResponseDtoCopyWithImpl<$Res, WeatherEventsResponseDto>;
  @useResult
  $Res call({String resolvedAddress, List<EventDto> events});
}

/// @nodoc
class _$WeatherEventsResponseDtoCopyWithImpl<$Res,
        $Val extends WeatherEventsResponseDto>
    implements $WeatherEventsResponseDtoCopyWith<$Res> {
  _$WeatherEventsResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherEventsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resolvedAddress = null,
    Object? events = null,
  }) {
    return _then(_value.copyWith(
      resolvedAddress: null == resolvedAddress
          ? _value.resolvedAddress
          : resolvedAddress // ignore: cast_nullable_to_non_nullable
              as String,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherEventsResponseDtoImplCopyWith<$Res>
    implements $WeatherEventsResponseDtoCopyWith<$Res> {
  factory _$$WeatherEventsResponseDtoImplCopyWith(
          _$WeatherEventsResponseDtoImpl value,
          $Res Function(_$WeatherEventsResponseDtoImpl) then) =
      __$$WeatherEventsResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String resolvedAddress, List<EventDto> events});
}

/// @nodoc
class __$$WeatherEventsResponseDtoImplCopyWithImpl<$Res>
    extends _$WeatherEventsResponseDtoCopyWithImpl<$Res,
        _$WeatherEventsResponseDtoImpl>
    implements _$$WeatherEventsResponseDtoImplCopyWith<$Res> {
  __$$WeatherEventsResponseDtoImplCopyWithImpl(
      _$WeatherEventsResponseDtoImpl _value,
      $Res Function(_$WeatherEventsResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherEventsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resolvedAddress = null,
    Object? events = null,
  }) {
    return _then(_$WeatherEventsResponseDtoImpl(
      resolvedAddress: null == resolvedAddress
          ? _value.resolvedAddress
          : resolvedAddress // ignore: cast_nullable_to_non_nullable
              as String,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherEventsResponseDtoImpl implements _WeatherEventsResponseDto {
  const _$WeatherEventsResponseDtoImpl(
      {required this.resolvedAddress, final List<EventDto> events = const []})
      : _events = events;

  factory _$WeatherEventsResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherEventsResponseDtoImplFromJson(json);

  @override
  final String resolvedAddress;
  final List<EventDto> _events;
  @override
  @JsonKey()
  List<EventDto> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  String toString() {
    return 'WeatherEventsResponseDto(resolvedAddress: $resolvedAddress, events: $events)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherEventsResponseDtoImpl &&
            (identical(other.resolvedAddress, resolvedAddress) ||
                other.resolvedAddress == resolvedAddress) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, resolvedAddress,
      const DeepCollectionEquality().hash(_events));

  /// Create a copy of WeatherEventsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherEventsResponseDtoImplCopyWith<_$WeatherEventsResponseDtoImpl>
      get copyWith => __$$WeatherEventsResponseDtoImplCopyWithImpl<
          _$WeatherEventsResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherEventsResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _WeatherEventsResponseDto implements WeatherEventsResponseDto {
  const factory _WeatherEventsResponseDto(
      {required final String resolvedAddress,
      final List<EventDto> events}) = _$WeatherEventsResponseDtoImpl;

  factory _WeatherEventsResponseDto.fromJson(Map<String, dynamic> json) =
      _$WeatherEventsResponseDtoImpl.fromJson;

  @override
  String get resolvedAddress;
  @override
  List<EventDto> get events;

  /// Create a copy of WeatherEventsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherEventsResponseDtoImplCopyWith<_$WeatherEventsResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EventDto _$EventDtoFromJson(Map<String, dynamic> json) {
  return _EventDto.fromJson(json);
}

/// @nodoc
mixin _$EventDto {
  String get type => throw _privateConstructorUsedError;
  String get datetime => throw _privateConstructorUsedError;
  String? get endtime => throw _privateConstructorUsedError;
  String get severity => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this EventDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventDtoCopyWith<EventDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDtoCopyWith<$Res> {
  factory $EventDtoCopyWith(EventDto value, $Res Function(EventDto) then) =
      _$EventDtoCopyWithImpl<$Res, EventDto>;
  @useResult
  $Res call(
      {String type,
      String datetime,
      String? endtime,
      String severity,
      double latitude,
      double longitude,
      String description});
}

/// @nodoc
class _$EventDtoCopyWithImpl<$Res, $Val extends EventDto>
    implements $EventDtoCopyWith<$Res> {
  _$EventDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? datetime = null,
    Object? endtime = freezed,
    Object? severity = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
      endtime: freezed == endtime
          ? _value.endtime
          : endtime // ignore: cast_nullable_to_non_nullable
              as String?,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventDtoImplCopyWith<$Res>
    implements $EventDtoCopyWith<$Res> {
  factory _$$EventDtoImplCopyWith(
          _$EventDtoImpl value, $Res Function(_$EventDtoImpl) then) =
      __$$EventDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      String datetime,
      String? endtime,
      String severity,
      double latitude,
      double longitude,
      String description});
}

/// @nodoc
class __$$EventDtoImplCopyWithImpl<$Res>
    extends _$EventDtoCopyWithImpl<$Res, _$EventDtoImpl>
    implements _$$EventDtoImplCopyWith<$Res> {
  __$$EventDtoImplCopyWithImpl(
      _$EventDtoImpl _value, $Res Function(_$EventDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? datetime = null,
    Object? endtime = freezed,
    Object? severity = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? description = null,
  }) {
    return _then(_$EventDtoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
      endtime: freezed == endtime
          ? _value.endtime
          : endtime // ignore: cast_nullable_to_non_nullable
              as String?,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventDtoImpl implements _EventDto {
  const _$EventDtoImpl(
      {this.type = '',
      this.datetime = '',
      this.endtime,
      this.severity = 'minor',
      this.latitude = 0.0,
      this.longitude = 0.0,
      this.description = ''});

  factory _$EventDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventDtoImplFromJson(json);

  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String datetime;
  @override
  final String? endtime;
  @override
  @JsonKey()
  final String severity;
  @override
  @JsonKey()
  final double latitude;
  @override
  @JsonKey()
  final double longitude;
  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'EventDto(type: $type, datetime: $datetime, endtime: $endtime, severity: $severity, latitude: $latitude, longitude: $longitude, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDtoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.endtime, endtime) || other.endtime == endtime) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, datetime, endtime,
      severity, latitude, longitude, description);

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDtoImplCopyWith<_$EventDtoImpl> get copyWith =>
      __$$EventDtoImplCopyWithImpl<_$EventDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventDtoImplToJson(
      this,
    );
  }
}

abstract class _EventDto implements EventDto {
  const factory _EventDto(
      {final String type,
      final String datetime,
      final String? endtime,
      final String severity,
      final double latitude,
      final double longitude,
      final String description}) = _$EventDtoImpl;

  factory _EventDto.fromJson(Map<String, dynamic> json) =
      _$EventDtoImpl.fromJson;

  @override
  String get type;
  @override
  String get datetime;
  @override
  String? get endtime;
  @override
  String get severity;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get description;

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventDtoImplCopyWith<_$EventDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
