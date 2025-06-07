import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:logger/logger.dart';

import 'package:weather_app/features/favorites/data/repositories/favorites_repositories_impl.dart';
import 'package:weather_app/features/favorites/data/models/sqflite_models.dart';
import 'package:weather_app/features/favorites/domain/entities/favorite_entities.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entities.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

import '../../../../mocks/mocks.mocks.dart';

@GenerateMocks([FavoritesDatabase, Logger])
void main() {
  group('FavoritesRepositoryImpl', () {
    late FavoritesRepositoryImpl repository;
    late MockFavoritesDatabase mockDatabase;
    late MockLogger mockLogger;

    setUp(() {
      mockDatabase = MockFavoritesDatabase();
      mockLogger = MockLogger();

      repository = FavoritesRepositoryImpl(
        database: mockDatabase,
        logger: mockLogger,
      );
    });

    group('getAllFavorites', () {
      final tFavoriteEvents = [
        FavoriteEventEntity(
          id: 'test_id_1',
          type: 'wind',
          title: 'Test Wind Event',
          description: 'Test description',
          startTime: DateTime.now(),
          severity: 'moderate',
          latitude: 6.2442,
          longitude: -75.5812,
          addedAt: DateTime.now(),
        ),
        FavoriteEventEntity(
          id: 'test_id_2',
          type: 'rain',
          title: 'Test Rain Event',
          description: 'Test rain description',
          startTime: DateTime.now(),
          severity: 'severe',
          latitude: 6.2442,
          longitude: -75.5812,
          addedAt: DateTime.now(),
        ),
      ];

      test('should return list of favorite events when successful', () async {
        // Arrange
        when(
          mockDatabase.getAllFavoriteEvents(),
        ).thenAnswer((_) async => tFavoriteEvents);

        // Act
        final result = await repository.getAllFavorites();

        // Assert
        expect(result.isSuccess, true);
        expect(result.data?.length, 2);
        expect(result.data?.first.id, 'test_id_1');
        expect(result.data?.first.type, 'wind');

        verify(mockDatabase.getAllFavoriteEvents()).called(1);
      });

      test(
        'should return CacheFailure when database throws exception',
        () async {
          // Arrange
          when(
            mockDatabase.getAllFavoriteEvents(),
          ).thenThrow(Exception('Database error'));

          // Act
          final result = await repository.getAllFavorites();

          // Assert
          expect(result.isError, true);
          expect(result.failure, isA<CacheFailure>());

          verify(mockDatabase.getAllFavoriteEvents()).called(1);
        },
      );
    });

    group('addToFavorites', () {
      final tWeatherEvent = WeatherEvent(
        id: 'test_event_id',
        type: 'storm',
        title: 'Test Storm',
        description: 'Test storm description',
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(hours: 2)),
        severity: 'severe',
        latitude: 6.2442,
        longitude: -75.5812,
      );

      test('should add event to favorites when not already favorite', () async {
        // Arrange
        when(
          mockDatabase.isFavorite('test_event_id'),
        ).thenAnswer((_) async => false);
        when(mockDatabase.insertFavoriteEvent(any)).thenAnswer((_) async => {});

        // Act
        final result = await repository.addToFavorites(tWeatherEvent);

        // Assert
        expect(result.isSuccess, true);

        verify(mockDatabase.isFavorite('test_event_id')).called(1);
        verify(mockDatabase.insertFavoriteEvent(any)).called(1);
      });

      test('should not add event when already favorite', () async {
        // Arrange
        when(
          mockDatabase.isFavorite('test_event_id'),
        ).thenAnswer((_) async => true);

        // Act
        final result = await repository.addToFavorites(tWeatherEvent);

        // Assert
        expect(result.isSuccess, true);

        verify(mockDatabase.isFavorite('test_event_id')).called(1);
        verifyNever(mockDatabase.insertFavoriteEvent(any));
      });

      test(
        'should return CacheFailure when database operation fails',
        () async {
          // Arrange
          when(
            mockDatabase.isFavorite('test_event_id'),
          ).thenAnswer((_) async => false);
          when(
            mockDatabase.insertFavoriteEvent(any),
          ).thenThrow(Exception('Database error'));

          // Act
          final result = await repository.addToFavorites(tWeatherEvent);

          // Assert
          expect(result.isError, true);
          expect(result.failure, isA<CacheFailure>());

          verify(mockDatabase.isFavorite('test_event_id')).called(1);
          verify(mockDatabase.insertFavoriteEvent(any)).called(1);
        },
      );
    });

    group('removeFromFavorites', () {
      test('should remove event from favorites successfully', () async {
        // Arrange
        when(
          mockDatabase.deleteFavoriteEvent('test_event_id'),
        ).thenAnswer((_) async => {});

        // Act
        final result = await repository.removeFromFavorites('test_event_id');

        // Assert
        expect(result.isSuccess, true);

        verify(mockDatabase.deleteFavoriteEvent('test_event_id')).called(1);
      });

      test('should return CacheFailure when deletion fails', () async {
        // Arrange
        when(
          mockDatabase.deleteFavoriteEvent('test_event_id'),
        ).thenThrow(Exception('Database error'));

        // Act
        final result = await repository.removeFromFavorites('test_event_id');

        // Assert
        expect(result.isError, true);
        expect(result.failure, isA<CacheFailure>());

        verify(mockDatabase.deleteFavoriteEvent('test_event_id')).called(1);
      });
    });

    group('isFavorite', () {
      test('should return true when event is favorite', () async {
        // Arrange
        when(
          mockDatabase.isFavorite('test_event_id'),
        ).thenAnswer((_) async => true);

        // Act
        final result = await repository.isFavorite('test_event_id');

        // Assert
        expect(result.isSuccess, true);
        expect(result.data, true);

        verify(mockDatabase.isFavorite('test_event_id')).called(1);
      });

      test('should return false when event is not favorite', () async {
        // Arrange
        when(
          mockDatabase.isFavorite('test_event_id'),
        ).thenAnswer((_) async => false);

        // Act
        final result = await repository.isFavorite('test_event_id');

        // Assert
        expect(result.isSuccess, true);
        expect(result.data, false);

        verify(mockDatabase.isFavorite('test_event_id')).called(1);
      });

      test('should return false when database operation fails', () async {
        // Arrange
        when(
          mockDatabase.isFavorite('test_event_id'),
        ).thenThrow(Exception('Database error'));

        // Act
        final result = await repository.isFavorite('test_event_id');

        // Assert
        expect(result.isSuccess, true);
        expect(result.data, false);

        verify(mockDatabase.isFavorite('test_event_id')).called(1);
      });
    });

    group('clearAllFavorites', () {
      final tFavoriteEvents = [
        FavoriteEventEntity(
          id: 'test_id_1',
          type: 'wind',
          title: 'Test Event 1',
          description: 'Description 1',
          startTime: DateTime.now(),
          severity: 'moderate',
          latitude: 6.2442,
          longitude: -75.5812,
          addedAt: DateTime.now(),
        ),
        FavoriteEventEntity(
          id: 'test_id_2',
          type: 'rain',
          title: 'Test Event 2',
          description: 'Description 2',
          startTime: DateTime.now(),
          severity: 'severe',
          latitude: 6.2442,
          longitude: -75.5812,
          addedAt: DateTime.now(),
        ),
      ];

      test('should clear all favorites successfully', () async {
        // Arrange
        when(
          mockDatabase.getAllFavoriteEvents(),
        ).thenAnswer((_) async => tFavoriteEvents);
        when(mockDatabase.deleteFavoriteEvent(any)).thenAnswer((_) async => {});

        // Act
        final result = await repository.clearAllFavorites();

        // Assert
        expect(result.isSuccess, true);

        verify(mockDatabase.getAllFavoriteEvents()).called(1);
        verify(mockDatabase.deleteFavoriteEvent('test_id_1')).called(1);
        verify(mockDatabase.deleteFavoriteEvent('test_id_2')).called(1);
      });

      test('should return CacheFailure when operation fails', () async {
        // Arrange
        when(
          mockDatabase.getAllFavoriteEvents(),
        ).thenThrow(Exception('Database error'));

        // Act
        final result = await repository.clearAllFavorites();

        // Assert
        expect(result.isError, true);
        expect(result.failure, isA<CacheFailure>());

        verify(mockDatabase.getAllFavoriteEvents()).called(1);
      });
    });

    group('cache operations', () {
      test('should cache weather data successfully', () async {
        // Arrange
        when(
          mockDatabase.insertCache(any, any, any),
        ).thenAnswer((_) async => {});

        // Act
        final result = await repository.cacheWeatherData(
          'test_key',
          'test_data',
          const Duration(minutes: 15),
        );

        // Assert
        expect(result.isSuccess, true);

        verify(
          mockDatabase.insertCache(
            'test_key',
            'test_data',
            const Duration(minutes: 15),
          ),
        ).called(1);
      });

      test('should get cached weather data successfully', () async {
        // Arrange
        when(
          mockDatabase.getCache('test_key'),
        ).thenAnswer((_) async => 'cached_data');

        // Act
        final result = await repository.getCachedWeatherData('test_key');

        // Assert
        expect(result.isSuccess, true);
        expect(result.data, 'cached_data');

        verify(mockDatabase.getCache('test_key')).called(1);
      });

      test('should clear expired cache successfully', () async {
        // Arrange
        when(mockDatabase.clearExpiredCache()).thenAnswer((_) async => {});

        // Act
        final result = await repository.clearExpiredCache();

        // Assert
        expect(result.isSuccess, true);

        verify(mockDatabase.clearExpiredCache()).called(1);
      });
    });
  });
}
