import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:weather_app/features/weather/presentation/widgets/weather_current_card.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entities.dart';

void main() {
  group('WeatherCurrentCard', () {
    late WeatherCurrent testWeather;

    setUp(() {
      testWeather = WeatherCurrent(
        location: 'Test Location',
        temperature: 25.0,
        conditions: 'Clear',
        icon: 'clear-day',
        humidity: 60.0,
        windSpeed: 10.0,
        pressure: 1013.0,
        datetime: DateTime.parse('2024-01-01T12:00:00'),
        feelsLike: 27.0,
        uvIndex: 5.0,
        visibility: 10.0,
      );
    });

    Widget createTestWidget(WeatherCurrent weather) {
      return ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: WeatherCurrentCard(weather: weather)),
        ),
      );
    }

    testWidgets('should display weather location', (tester) async {
      // Act
      await tester.pumpWidget(createTestWidget(testWeather));

      // Assert
      expect(find.text('Test Location'), findsOneWidget);
    });

    testWidgets('should display temperature', (tester) async {
      // Act
      await tester.pumpWidget(createTestWidget(testWeather));

      // Assert
      expect(find.text('25°C'), findsOneWidget);
    });

    testWidgets('should display weather conditions', (tester) async {
      // Act
      await tester.pumpWidget(createTestWidget(testWeather));

      // Assert
      expect(find.text('Despejado'), findsOneWidget); // Spanish translation
    });

    testWidgets('should display feels like temperature', (tester) async {
      // Act
      await tester.pumpWidget(createTestWidget(testWeather));

      // Assert
      expect(find.text('Sensación: 27°C'), findsOneWidget);
    });

    testWidgets('should display humidity', (tester) async {
      // Act
      await tester.pumpWidget(createTestWidget(testWeather));

      // Assert
      expect(find.text('Humedad: '), findsOneWidget);
      expect(find.text('60%'), findsOneWidget);
    });

    testWidgets('should display wind speed', (tester) async {
      // Act
      await tester.pumpWidget(createTestWidget(testWeather));

      // Assert
      expect(find.text('Viento: '), findsOneWidget);
      expect(find.text('10 km/h'), findsOneWidget);
    });

    testWidgets('should display pressure', (tester) async {
      // Act
      await tester.pumpWidget(createTestWidget(testWeather));

      // Assert
      expect(find.text('Presión: '), findsOneWidget);
      expect(find.text('1013 hPa'), findsOneWidget);
    });

    testWidgets('should display UV index', (tester) async {
      // Act
      await tester.pumpWidget(createTestWidget(testWeather));

      // Assert
      expect(find.text('UV: '), findsOneWidget);
      expect(find.text('5.0'), findsOneWidget);
    });

    testWidgets('should display visibility', (tester) async {
      // Act
      await tester.pumpWidget(createTestWidget(testWeather));

      // Assert
      expect(find.text('Visibilidad: '), findsOneWidget);
      expect(find.text('10 km'), findsOneWidget);
    });

    testWidgets('should display weather icon', (tester) async {
      // Act
      await tester.pumpWidget(createTestWidget(testWeather));

      // Assert
      expect(find.text('☀️'), findsOneWidget); // Weather icon emoji
    });

    testWidgets('should display date as "Hoy" for today', (tester) async {
      // Arrange
      final todayWeather = testWeather.copyWith(datetime: DateTime.now());

      // Act
      await tester.pumpWidget(createTestWidget(todayWeather));

      // Assert
      expect(find.textContaining('Hoy'), findsOneWidget);
    });

    testWidgets('should be wrapped in a Card', (tester) async {
      // Act
      await tester.pumpWidget(createTestWidget(testWeather));

      // Assert
      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('should handle different weather conditions', (tester) async {
      // Arrange
      final rainyWeather = testWeather.copyWith(
        conditions: 'Rain',
        icon: 'rain',
        temperature: 18.0,
      );

      // Act
      await tester.pumpWidget(createTestWidget(rainyWeather));

      // Assert
      expect(find.text('18°C'), findsOneWidget);
      expect(find.text('🌧️'), findsOneWidget); // Rain icon
    });

    testWidgets('should handle long location names', (tester) async {
      // Arrange
      final longLocationWeather = testWeather.copyWith(
        location: 'This is a very long location name that should be truncated',
      );

      // Act
      await tester.pumpWidget(createTestWidget(longLocationWeather));

      // Assert
      expect(find.textContaining('This is a very long'), findsOneWidget);
    });

    testWidgets('should display all weather details in proper layout', (
      tester,
    ) async {
      // Act
      await tester.pumpWidget(createTestWidget(testWeather));

      // Assert
      // Verify the main components are present
      expect(find.byType(Row), findsWidgets); // Multiple rows for layout
      expect(find.byType(Column), findsWidgets); // Multiple columns for layout
      expect(find.byType(Padding), findsWidgets); // Padding for spacing

      // Verify weather details section
      final detailFinder = find.textContaining('Humedad: ');
      expect(detailFinder, findsOneWidget);
    });
  });
}
