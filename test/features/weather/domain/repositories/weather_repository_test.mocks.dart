// Mocks generated by Mockito 5.4.5 from annotations
// in weather_app/test/features/weather/domain/repositories/weather_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:connectivity_plus/connectivity_plus.dart' as _i6;
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart'
    as _i7;
import 'package:logger/src/log_level.dart' as _i9;
import 'package:logger/src/logger.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shared_preferences/src/shared_preferences_legacy.dart' as _i5;
import 'package:weather_app/features/weather/data/datasources/weather_api_service.dart'
    as _i3;
import 'package:weather_app/features/weather/data/models/weather_dtos.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeWeatherResponseDto_0 extends _i1.SmartFake
    implements _i2.WeatherResponseDto {
  _FakeWeatherResponseDto_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWeatherEventsResponseDto_1 extends _i1.SmartFake
    implements _i2.WeatherEventsResponseDto {
  _FakeWeatherEventsResponseDto_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [WeatherApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherApiService extends _i1.Mock implements _i3.WeatherApiService {
  MockWeatherApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.WeatherResponseDto> getCurrentWeather(
    String? location,
    String? apiKey,
    String? unitGroup,
    String? include,
    String? lang,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentWeather,
          [
            location,
            apiKey,
            unitGroup,
            include,
            lang,
          ],
        ),
        returnValue:
            _i4.Future<_i2.WeatherResponseDto>.value(_FakeWeatherResponseDto_0(
          this,
          Invocation.method(
            #getCurrentWeather,
            [
              location,
              apiKey,
              unitGroup,
              include,
              lang,
            ],
          ),
        )),
      ) as _i4.Future<_i2.WeatherResponseDto>);

  @override
  _i4.Future<_i2.WeatherResponseDto> getForecast(
    String? location,
    String? apiKey,
    String? unitGroup,
    String? include,
    String? lang,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getForecast,
          [
            location,
            apiKey,
            unitGroup,
            include,
            lang,
          ],
        ),
        returnValue:
            _i4.Future<_i2.WeatherResponseDto>.value(_FakeWeatherResponseDto_0(
          this,
          Invocation.method(
            #getForecast,
            [
              location,
              apiKey,
              unitGroup,
              include,
              lang,
            ],
          ),
        )),
      ) as _i4.Future<_i2.WeatherResponseDto>);

  @override
  _i4.Future<_i2.WeatherEventsResponseDto> getWeatherEvents(
    String? location,
    String? apiKey,
    String? include,
    String? events,
    String? lang,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWeatherEvents,
          [
            location,
            apiKey,
            include,
            events,
            lang,
          ],
        ),
        returnValue: _i4.Future<_i2.WeatherEventsResponseDto>.value(
            _FakeWeatherEventsResponseDto_1(
          this,
          Invocation.method(
            #getWeatherEvents,
            [
              location,
              apiKey,
              include,
              events,
              lang,
            ],
          ),
        )),
      ) as _i4.Future<_i2.WeatherEventsResponseDto>);
}

/// A class which mocks [SharedPreferences].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferences extends _i1.Mock implements _i5.SharedPreferences {
  MockSharedPreferences() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Set<String> getKeys() => (super.noSuchMethod(
        Invocation.method(
          #getKeys,
          [],
        ),
        returnValue: <String>{},
      ) as Set<String>);

  @override
  Object? get(String? key) => (super.noSuchMethod(Invocation.method(
        #get,
        [key],
      )) as Object?);

  @override
  bool? getBool(String? key) => (super.noSuchMethod(Invocation.method(
        #getBool,
        [key],
      )) as bool?);

  @override
  int? getInt(String? key) => (super.noSuchMethod(Invocation.method(
        #getInt,
        [key],
      )) as int?);

  @override
  double? getDouble(String? key) => (super.noSuchMethod(Invocation.method(
        #getDouble,
        [key],
      )) as double?);

  @override
  String? getString(String? key) => (super.noSuchMethod(Invocation.method(
        #getString,
        [key],
      )) as String?);

  @override
  bool containsKey(String? key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: false,
      ) as bool);

  @override
  List<String>? getStringList(String? key) =>
      (super.noSuchMethod(Invocation.method(
        #getStringList,
        [key],
      )) as List<String>?);

  @override
  _i4.Future<bool> setBool(
    String? key,
    bool? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setBool,
          [
            key,
            value,
          ],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> setInt(
    String? key,
    int? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setInt,
          [
            key,
            value,
          ],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> setDouble(
    String? key,
    double? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setDouble,
          [
            key,
            value,
          ],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> setString(
    String? key,
    String? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setString,
          [
            key,
            value,
          ],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> setStringList(
    String? key,
    List<String>? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setStringList,
          [
            key,
            value,
          ],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> remove(String? key) => (super.noSuchMethod(
        Invocation.method(
          #remove,
          [key],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> commit() => (super.noSuchMethod(
        Invocation.method(
          #commit,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> clear() => (super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<void> reload() => (super.noSuchMethod(
        Invocation.method(
          #reload,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [Connectivity].
///
/// See the documentation for Mockito's code generation for more information.
class MockConnectivity extends _i1.Mock implements _i6.Connectivity {
  MockConnectivity() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<_i7.ConnectivityResult> get onConnectivityChanged =>
      (super.noSuchMethod(
        Invocation.getter(#onConnectivityChanged),
        returnValue: _i4.Stream<_i7.ConnectivityResult>.empty(),
      ) as _i4.Stream<_i7.ConnectivityResult>);

  @override
  _i4.Future<_i7.ConnectivityResult> checkConnectivity() => (super.noSuchMethod(
        Invocation.method(
          #checkConnectivity,
          [],
        ),
        returnValue: _i4.Future<_i7.ConnectivityResult>.value(
            _i7.ConnectivityResult.bluetooth),
      ) as _i4.Future<_i7.ConnectivityResult>);
}

/// A class which mocks [Logger].
///
/// See the documentation for Mockito's code generation for more information.
class MockLogger extends _i1.Mock implements _i8.Logger {
  MockLogger() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> get init => (super.noSuchMethod(
        Invocation.getter(#init),
        returnValue: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  void v(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #v,
          [message],
          {
            #time: time,
            #error: error,
            #stackTrace: stackTrace,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void t(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #t,
          [message],
          {
            #time: time,
            #error: error,
            #stackTrace: stackTrace,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void d(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #d,
          [message],
          {
            #time: time,
            #error: error,
            #stackTrace: stackTrace,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void i(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #i,
          [message],
          {
            #time: time,
            #error: error,
            #stackTrace: stackTrace,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void w(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #w,
          [message],
          {
            #time: time,
            #error: error,
            #stackTrace: stackTrace,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void e(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #e,
          [message],
          {
            #time: time,
            #error: error,
            #stackTrace: stackTrace,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void wtf(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #wtf,
          [message],
          {
            #time: time,
            #error: error,
            #stackTrace: stackTrace,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void f(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #f,
          [message],
          {
            #time: time,
            #error: error,
            #stackTrace: stackTrace,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void log(
    _i9.Level? level,
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #log,
          [
            level,
            message,
          ],
          {
            #time: time,
            #error: error,
            #stackTrace: stackTrace,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool isClosed() => (super.noSuchMethod(
        Invocation.method(
          #isClosed,
          [],
        ),
        returnValue: false,
      ) as bool);

  @override
  _i4.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
