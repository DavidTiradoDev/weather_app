import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/weather/data/datasources/weather_api_service.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entities.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/weather/data/models/weather_dtos.dart';
import 'package:weather_app/core/errors/failures.dart';

import '../../../../mocks/mocks.mocks.dart';

@GenerateMocks([WeatherApiService, SharedPreferences, Connectivity, Logger])
void main() {
  group('WeatherRepositoryImpl', () {
    late WeatherRepositoryImpl repository;
    late MockWeatherApiService mockApiService;
    late MockSharedPreferences mockSharedPreferences;
    late MockConnectivity mockConnectivity;
    late MockLogger mockLogger;

    setUp(() {
      mockApiService = MockWeatherApiService();
      mockSharedPreferences = MockSharedPreferences();
      mockConnectivity = MockConnectivity();
      mockLogger = MockLogger();

      repository = WeatherRepositoryImpl(
        apiService: mockApiService,
        sharedPreferences: mockSharedPreferences,
        connectivity: mockConnectivity,
        logger: mockLogger,
      );
    });

    group('getCurrentWeather', () {
      const tLocation = LocationInfo(
        name: 'Test Location',
        country: 'Test Country',
        region: 'Test Region',
        latitude: 6.2442,
        longitude: -75.5812,
      );

      const tWeatherResponseDto = WeatherResponseDto(
        resolvedAddress: 'Test Location',
        timezone: 'America/Bogota',
        currentConditions: CurrentConditionsDto(
          datetime: '2024-01-01T12:00:00',
          temp: 25.0,
          feelslike: 27.0,
          humidity: 60.0,
          windspeed: 10.0,
          pressure: 1013.0,
          uvindex: 5.0,
          visibility: 10.0,
          conditions: 'Clear',
          icon: 'clear-day',
        ),
      );

      test(
        'should return WeatherCurrent when connected and API call succeeds',
        () async {
          // Arrange
          when(
            mockConnectivity.checkConnectivity(),
          ).thenAnswer((_) async => ConnectivityResult.wifi);
          when(
            mockApiService.getCurrentWeather(any, any, any, any, any),
          ).thenAnswer((_) async => tWeatherResponseDto);
          when(
            mockSharedPreferences.setString(any, any),
          ).thenAnswer((_) async => true);
          when(
            mockSharedPreferences.setInt(any, any),
          ).thenAnswer((_) async => true);

          // Act
          final result = await repository.getCurrentWeather(tLocation);

          // Assert
          expect(result.isSuccess, true);
          expect(result.data, isA<WeatherCurrent>());
          expect(result.data?.location, 'Test Location');
          expect(result.data?.temperature, 25.0);

          verify(mockConnectivity.checkConnectivity()).called(1);
          verify(
            mockApiService.getCurrentWeather(
              '6.2442,-75.5812',
              any,
              any,
              any,
              any,
            ),
          ).called(1);
        },
      );

      test('should return cached data when offline and cache exists', () async {
        // Arrange
        when(
          mockConnectivity.checkConnectivity(),
        ).thenAnswer((_) async => ConnectivityResult.none);
        when(
          mockSharedPreferences.getInt(any),
        ).thenReturn(DateTime.now().millisecondsSinceEpoch);
        when(mockSharedPreferences.getString(any)).thenReturn(
          '{"resolvedAddress":"Test Location","currentConditions":{"datetime":"2024-01-01T12:00:00","temp":25.0,"feelslike":27.0,"humidity":60.0,"windspeed":10.0,"pressure":1013.0,"uvindex":5.0,"visibility":10.0,"conditions":"Clear","icon":"clear-day"}}',
        );

        // Act
        final result = await repository.getCurrentWeather(tLocation);

        // Assert
        expect(result.isSuccess, true);
        expect(result.data, isA<WeatherCurrent>());

        verify(mockConnectivity.checkConnectivity()).called(1);
        verifyNever(mockApiService.getCurrentWeather(any, any, any, any, any));
      });

      test('should return NetworkFailure when offline and no cache', () async {
        // Arrange
        when(
          mockConnectivity.checkConnectivity(),
        ).thenAnswer((_) async => ConnectivityResult.none);
        when(mockSharedPreferences.getInt(any)).thenReturn(null);
        when(mockSharedPreferences.getString(any)).thenReturn(null);

        // Act
        final result = await repository.getCurrentWeather(tLocation);

        // Assert
        expect(result.isError, true);
        expect(result.failure, isA<NetworkFailure>());

        verify(mockConnectivity.checkConnectivity()).called(1);
        verifyNever(mockApiService.getCurrentWeather(any, any, any, any, any));
      });

      test('should return ServerFailure when API call fails', () async {
        // Arrange
        when(
          mockConnectivity.checkConnectivity(),
        ).thenAnswer((_) async => ConnectivityResult.wifi);
        when(
          mockApiService.getCurrentWeather(any, any, any, any, any),
        ).thenThrow(Exception('API Error'));

        // Act
        final result = await repository.getCurrentWeather(tLocation);

        // Assert
        expect(result.isError, true);
        expect(result.failure, isA<UnknownFailure>());

        verify(mockConnectivity.checkConnectivity()).called(1);
        verify(
          mockApiService.getCurrentWeather(any, any, any, any, any),
        ).called(1);
      });
    });

    group('getCurrentLocation', () {
      test(
        'should return default location when location service fails',
        () async {
          // Act
          final result = await repository.getCurrentLocation();

          // Assert
          expect(result.isSuccess, true);
          expect(result.data?.name, 'Medellín, Colombia');
          expect(result.data?.latitude, 6.2442);
          expect(result.data?.longitude, -75.5812);
        },
      );
    });

    group('searchLocations', () {
      test('should return predefined locations for any query', () async {
        // Act
        final result = await repository.searchLocations('Bogota');

        // Assert
        expect(result.isSuccess, true);
        expect(result.data, isA<List<LocationInfo>>());
        expect(result.data?.length, greaterThan(0));
      });
    });

    group('isConnected', () {
      test('should return true when connected to wifi', () async {
        // Arrange
        when(
          mockConnectivity.checkConnectivity(),
        ).thenAnswer((_) async => ConnectivityResult.wifi);

        // Act
        final result = await repository.isConnected();

        // Assert
        expect(result, true);
        verify(mockConnectivity.checkConnectivity()).called(1);
      });

      test('should return false when not connected', () async {
        // Arrange
        when(
          mockConnectivity.checkConnectivity(),
        ).thenAnswer((_) async => ConnectivityResult.none);

        // Act
        final result = await repository.isConnected();

        // Assert
        expect(result, false);
        verify(mockConnectivity.checkConnectivity()).called(1);
      });
    });

    group('cacheWeatherData', () {
      test('should cache data successfully', () async {
        // Arrange
        when(
          mockSharedPreferences.setString(any, any),
        ).thenAnswer((_) async => true);
        when(
          mockSharedPreferences.setInt(any, any),
        ).thenAnswer((_) async => true);

        // Act
        await repository.cacheWeatherData('test_key', {'test': 'data'});

        // Assert
        verify(mockSharedPreferences.setString('test_key', any)).called(1);
        verify(
          mockSharedPreferences.setInt('test_key_timestamp', any),
        ).called(1);
      });
    });

    group('getCachedWeatherData', () {
      test('should return cached data when not expired', () async {
        // Arrange
        final now = DateTime.now();
        when(
          mockSharedPreferences.getInt('test_key_timestamp'),
        ).thenReturn(now.millisecondsSinceEpoch);
        when(
          mockSharedPreferences.getString('test_key'),
        ).thenReturn('{"test":"data"}');

        // Act
        final result = await repository
            .getCachedWeatherData<Map<String, dynamic>>('test_key');

        // Assert
        expect(result, isNotNull);
        expect(result?['test'], 'data');
      });

      test('should return null when cache is expired', () async {
        // Arrange
        final oldTime = DateTime.now().subtract(const Duration(hours: 2));
        when(
          mockSharedPreferences.getInt('test_key_timestamp'),
        ).thenReturn(oldTime.millisecondsSinceEpoch);

        // Act
        final result = await repository
            .getCachedWeatherData<Map<String, dynamic>>('test_key');

        // Assert
        expect(result, isNull);
      });

      test('should return null when no cache exists', () async {
        // Arrange
        when(
          mockSharedPreferences.getInt('test_key_timestamp'),
        ).thenReturn(null);

        // Act
        final result = await repository
            .getCachedWeatherData<Map<String, dynamic>>('test_key');

        // Assert
        expect(result, isNull);
      });
    });
  });
}
