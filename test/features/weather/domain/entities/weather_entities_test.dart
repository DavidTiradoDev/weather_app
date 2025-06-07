import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

import 'package:weather_app/features/weather/domain/entities/weather_entities.dart';

void main() {
  group('WeatherCurrent', () {
    final tDateTime = DateTime.parse('2024-01-01T12:00:00');
    final tWeatherCurrent = WeatherCurrent(
      location: 'Test Location',
      temperature: 25.0,
      conditions: 'Clear',
      icon: 'clear-day',
      humidity: 60.0,
      windSpeed: 10.0,
      pressure: 1013.0,
      datetime: tDateTime,
      feelsLike: 27.0,
      uvIndex: 5.0,
      visibility: 10.0,
    );

    test('should be a subclass of WeatherCurrent', () {
      expect(tWeatherCurrent, isA<WeatherCurrent>());
    });

    test('should serialize to JSON correctly', () {
      // Act
      final json = tWeatherCurrent.toJson();

      // Assert
      expect(json, {
        'location': 'Test Location',
        'temperature': 25.0,
        'conditions': 'Clear',
        'icon': 'clear-day',
        'humidity': 60.0,
        'windSpeed': 10.0,
        'pressure': 1013.0,
        'datetime': '2024-01-01T12:00:00.000',
        'feelsLike': 27.0,
        'uvIndex': 5.0,
        'visibility': 10.0,
      });
    });

    test('should deserialize from JSON correctly', () {
      // Arrange
      final json = {
        'location': 'Test Location',
        'temperature': 25.0,
        'conditions': 'Clear',
        'icon': 'clear-day',
        'humidity': 60.0,
        'windSpeed': 10.0,
        'pressure': 1013.0,
        'datetime': '2024-01-01T12:00:00.000',
        'feelsLike': 27.0,
        'uvIndex': 5.0,
        'visibility': 10.0,
      };

      // Act
      final result = WeatherCurrent.fromJson(json);

      // Assert
      expect(result.location, tWeatherCurrent.location);
      expect(result.temperature, tWeatherCurrent.temperature);
      expect(result.conditions, tWeatherCurrent.conditions);
      expect(result.datetime, tWeatherCurrent.datetime);
    });

    test('should create copy with different values', () {
      // Act
      final copy = tWeatherCurrent.copyWith(
        temperature: 30.0,
        conditions: 'Sunny',
      );

      // Assert
      expect(copy.temperature, 30.0);
      expect(copy.conditions, 'Sunny');
      expect(copy.location, 'Test Location'); // Should remain the same
      expect(copy.humidity, 60.0); // Should remain the same
    });

    test('should be equal when all properties are the same', () {
      // Arrange
      final tWeatherCurrent2 = WeatherCurrent(
        location: 'Test Location',
        temperature: 25.0,
        conditions: 'Clear',
        icon: 'clear-day',
        humidity: 60.0,
        windSpeed: 10.0,
        pressure: 1013.0,
        datetime: tDateTime,
        feelsLike: 27.0,
        uvIndex: 5.0,
        visibility: 10.0,
      );

      // Assert
      expect(tWeatherCurrent.location, equals(tWeatherCurrent2.location));
      expect(tWeatherCurrent.temperature, equals(tWeatherCurrent2.temperature));
      expect(tWeatherCurrent.datetime, equals(tWeatherCurrent2.datetime));
    });
  });

  group('WeatherDay', () {
    final tDateTime = DateTime.parse('2024-01-01');
    final tWeatherDay = WeatherDay(
      date: tDateTime,
      tempMax: 30.0,
      tempMin: 20.0,
      conditions: 'Clear',
      icon: 'clear-day',
      humidity: 60.0,
      windSpeed: 10.0,
      precipitationProbability: 0.0,
      description: 'Clear day',
    );

    test('should be a subclass of WeatherDay', () {
      expect(tWeatherDay, isA<WeatherDay>());
    });

    test('should serialize to JSON correctly', () {
      // Act
      final json = tWeatherDay.toJson();

      // Assert
      expect(json, {
        'date': '2024-01-01T00:00:00.000',
        'tempMax': 30.0,
        'tempMin': 20.0,
        'conditions': 'Clear',
        'icon': 'clear-day',
        'humidity': 60.0,
        'windSpeed': 10.0,
        'precipitationProbability': 0.0,
        'description': 'Clear day',
      });
    });

    test('should deserialize from JSON correctly', () {
      // Arrange
      final json = {
        'date': '2024-01-01T00:00:00.000',
        'tempMax': 30.0,
        'tempMin': 20.0,
        'conditions': 'Clear',
        'icon': 'clear-day',
        'humidity': 60.0,
        'windSpeed': 10.0,
        'precipitationProbability': 0.0,
        'description': 'Clear day',
      };

      // Act
      final result = WeatherDay.fromJson(json);

      // Assert
      expect(result.date, tDateTime);
      expect(result.tempMax, 30.0);
      expect(result.tempMin, 20.0);
      expect(result.conditions, 'Clear');
      expect(result.icon, 'clear-day');
      expect(result.humidity, 60.0);
      expect(result.windSpeed, 10.0);
      expect(result.precipitationProbability, 0.0);
      expect(result.description, 'Clear day');
    });

    test('should create copy with different values', () {
      // Act
      final copy = tWeatherDay.copyWith(tempMax: 35.0, conditions: 'Hot');

      // Assert
      expect(copy.tempMax, 35.0);
      expect(copy.conditions, 'Hot');
      expect(copy.date, tDateTime); // Should remain the same
      expect(copy.tempMin, 20.0); // Should remain the same
    });
  });

  group('WeatherEvent', () {
    final tStartTime = DateTime.parse('2024-01-01T10:00:00');
    final tEndTime = DateTime.parse('2024-01-01T12:00:00');
    final tWeatherEvent = WeatherEvent(
      id: 'event_1',
      type: 'wind',
      title: 'Wind Alert',
      description: 'Strong winds expected',
      startTime: tStartTime,
      endTime: tEndTime,
      severity: 'moderate',
      latitude: 6.2442,
      longitude: -75.5812,
      isFavorite: false,
    );

    test('should be a subclass of WeatherEvent', () {
      expect(tWeatherEvent, isA<WeatherEvent>());
    });

    test('should serialize to JSON correctly', () {
      // Act
      final json = tWeatherEvent.toJson();

      // Assert
      expect(json, {
        'id': 'event_1',
        'type': 'wind',
        'title': 'Wind Alert',
        'description': 'Strong winds expected',
        'startTime': '2024-01-01T10:00:00.000',
        'endTime': '2024-01-01T12:00:00.000',
        'severity': 'moderate',
        'latitude': 6.2442,
        'longitude': -75.5812,
        'isFavorite': false,
      });
    });

    test('should deserialize from JSON correctly', () {
      // Arrange
      final json = {
        'id': 'event_1',
        'type': 'wind',
        'title': 'Wind Alert',
        'description': 'Strong winds expected',
        'startTime': '2024-01-01T10:00:00.000',
        'endTime': '2024-01-01T12:00:00.000',
        'severity': 'moderate',
        'latitude': 6.2442,
        'longitude': -75.5812,
        'isFavorite': false,
      };

      // Act
      final result = WeatherEvent.fromJson(json);

      // Assert
      expect(result.id, tWeatherEvent.id);
      expect(result.type, tWeatherEvent.type);
      expect(result.title, tWeatherEvent.title);
      expect(result.startTime, tWeatherEvent.startTime);
      expect(result.endTime, tWeatherEvent.endTime);
      expect(result.severity, tWeatherEvent.severity);
      expect(result.isFavorite, tWeatherEvent.isFavorite);
    });

    test('should handle null endTime', () {
      // Arrange
      final eventWithoutEndTime = WeatherEvent(
        id: 'event_2',
        type: 'rain',
        title: 'Rain Alert',
        description: 'Rain expected',
        startTime: tStartTime,
        endTime: null,
        severity: 'minor',
        latitude: 6.2442,
        longitude: -75.5812,
      );

      // Act
      final json = eventWithoutEndTime.toJson();
      final fromJson = WeatherEvent.fromJson(json);

      // Assert
      expect(json['endTime'], isNull);
      expect(fromJson.endTime, isNull);
      expect(fromJson.id, eventWithoutEndTime.id);
      expect(fromJson.type, eventWithoutEndTime.type);
    });

    test('should default isFavorite to false', () {
      // Arrange
      final eventWithDefaultFavorite = WeatherEvent(
        id: 'event_3',
        type: 'storm',
        title: 'Storm Alert',
        description: 'Storm expected',
        startTime: tStartTime,
        endTime: tEndTime,
        severity: 'severe',
        latitude: 6.2442,
        longitude: -75.5812,
      );

      // Assert
      expect(eventWithDefaultFavorite.isFavorite, false);
    });

    test('should create copy with updated favorite status', () {
      // Act
      final favoriteEvent = tWeatherEvent.copyWith(isFavorite: true);

      // Assert
      expect(favoriteEvent.isFavorite, true);
      expect(favoriteEvent.id, tWeatherEvent.id);
      expect(favoriteEvent.title, tWeatherEvent.title);
    });
  });

  group('WeatherForecast', () {
    final tDateTime1 = DateTime.parse('2024-01-01');
    final tDateTime2 = DateTime.parse('2024-01-02');

    final tWeatherDays = [
      WeatherDay(
        date: tDateTime1,
        tempMax: 30.0,
        tempMin: 20.0,
        conditions: 'Clear',
        icon: 'clear-day',
        humidity: 60.0,
        windSpeed: 10.0,
        precipitationProbability: 0.0,
        description: 'Clear day',
      ),
      WeatherDay(
        date: tDateTime2,
        tempMax: 28.0,
        tempMin: 18.0,
        conditions: 'Cloudy',
        icon: 'cloudy',
        humidity: 70.0,
        windSpeed: 5.0,
        precipitationProbability: 20.0,
        description: 'Cloudy day',
      ),
    ];

    final tWeatherForecast = WeatherForecast(
      location: 'Test Location',
      days: tWeatherDays,
    );

    test('should be a subclass of WeatherForecast', () {
      expect(tWeatherForecast, isA<WeatherForecast>());
    });

    test('should serialize to JSON correctly', () {
      // Act
      final json = tWeatherForecast.toJson();

      // Assert
      expect(json['location'], 'Test Location');
      expect(json['days'], isA<List>());
      expect(json['days'].length, 2);
      expect(json['days'][0]['tempMax'], 30.0);
      expect(json['days'][1]['tempMax'], 28.0);
    });

    test('should deserialize from JSON correctly', () {
      // Arrange
      final json = tWeatherForecast.toJson();

      // Act
      final result = WeatherForecast.fromJson(json);

      // Assert
      expect(result.location, 'Test Location');
      expect(result.days.length, 2);
      expect(result.days[0].tempMax, 30.0);
      expect(result.days[1].tempMax, 28.0);
    });

    test('should handle empty days list', () {
      // Arrange
      const emptyForecast = WeatherForecast(
        location: 'Empty Location',
        days: [],
      );

      // Act
      final json = emptyForecast.toJson();
      final fromJson = WeatherForecast.fromJson(json);

      // Assert
      expect(fromJson.days, isEmpty);
      expect(fromJson.location, 'Empty Location');
    });

    test('should create copy with different location', () {
      // Act
      final copy = tWeatherForecast.copyWith(location: 'New Location');

      // Assert
      expect(copy.location, 'New Location');
      expect(copy.days.length, 2); // Should remain the same
      expect(copy.days[0].tempMax, 30.0); // Should remain the same
    });
  });

  group('LocationInfo', () {
    const tLocationInfo = LocationInfo(
      name: 'Medellín',
      country: 'Colombia',
      region: 'Antioquia',
      latitude: 6.2442,
      longitude: -75.5812,
    );

    test('should be a subclass of LocationInfo', () {
      expect(tLocationInfo, isA<LocationInfo>());
    });

    test('should serialize to JSON correctly', () {
      // Act
      final json = tLocationInfo.toJson();

      // Assert
      expect(json, {
        'name': 'Medellín',
        'country': 'Colombia',
        'region': 'Antioquia',
        'latitude': 6.2442,
        'longitude': -75.5812,
      });
    });

    test('should deserialize from JSON correctly', () {
      // Arrange
      final json = {
        'name': 'Medellín',
        'country': 'Colombia',
        'region': 'Antioquia',
        'latitude': 6.2442,
        'longitude': -75.5812,
      };

      // Act
      final result = LocationInfo.fromJson(json);

      // Assert
      expect(result, tLocationInfo);
    });

    test('should be equal when all properties are the same', () {
      // Arrange
      const tLocationInfo2 = LocationInfo(
        name: 'Medellín',
        country: 'Colombia',
        region: 'Antioquia',
        latitude: 6.2442,
        longitude: -75.5812,
      );

      // Assert
      expect(tLocationInfo, equals(tLocationInfo2));
      expect(tLocationInfo.hashCode, equals(tLocationInfo2.hashCode));
    });

    test('should not be equal when properties differ', () {
      // Arrange
      const tLocationInfo3 = LocationInfo(
        name: 'Bogotá',
        country: 'Colombia',
        region: 'Cundinamarca',
        latitude: 4.7110,
        longitude: -74.0721,
      );

      // Assert
      expect(tLocationInfo, isNot(equals(tLocationInfo3)));
      expect(tLocationInfo.hashCode, isNot(equals(tLocationInfo3.hashCode)));
    });

    test('should create copy with different values', () {
      // Act
      final copy = tLocationInfo.copyWith(
        name: 'Bogotá',
        latitude: 4.7110,
        longitude: -74.0721,
      );

      // Assert
      expect(copy.name, 'Bogotá');
      expect(copy.latitude, 4.7110);
      expect(copy.longitude, -74.0721);
      expect(copy.country, 'Colombia'); // Should remain the same
      expect(copy.region, 'Antioquia'); // Should remain the same
    });

    test('should handle different coordinate formats', () {
      // Arrange
      const negativeCoords = LocationInfo(
        name: 'London',
        country: 'UK',
        region: 'England',
        latitude: 51.5074,
        longitude: -0.1278,
      );

      // Act
      final json = negativeCoords.toJson();
      final fromJson = LocationInfo.fromJson(json);

      // Assert
      expect(fromJson.latitude, 51.5074);
      expect(fromJson.longitude, -0.1278);
      expect(fromJson.name, 'London');
    });

    test('should validate location data integrity', () {
      // Act & Assert
      expect(tLocationInfo.name.isNotEmpty, true);
      expect(tLocationInfo.country.isNotEmpty, true);
      expect(tLocationInfo.region.isNotEmpty, true);
      expect(tLocationInfo.latitude, isA<double>());
      expect(tLocationInfo.longitude, isA<double>());
    });
  });
}
