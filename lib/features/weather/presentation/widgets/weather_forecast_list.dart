import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/weather_entities.dart';
import '../../../../core/constants/app_constants.dart';

class WeatherForecastList extends ConsumerWidget {
  final WeatherForecast forecast;

  const WeatherForecastList({super.key, required this.forecast});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: forecast.days.length > 5 ? 5 : forecast.days.length,
        itemBuilder: (context, index) {
          final day = forecast.days[index];
          return _buildForecastItem(context, day, index);
        },
      ),
    );
  }

  Widget _buildForecastItem(BuildContext context, WeatherDay day, int index) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _getDayName(day.date, index),
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                _getWeatherIcon(day.icon),
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 8),
              Text(
                '${day.tempMax.round()}°',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Text(
                  '${day.tempMin.round()}°',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getDayName(DateTime date, int index) {
    final now = DateTime.now();

    if (index == 0 &&
        date.day == now.day &&
        date.month == now.month &&
        date.year == now.year) {
      return 'Hoy';
    }

    if (index == 1) {
      final tomorrow = now.add(const Duration(days: 1));
      if (date.day == tomorrow.day &&
          date.month == tomorrow.month &&
          date.year == tomorrow.year) {
        return 'Mañana';
      }
    }

    // Usar nombres de días en español manualmente (más confiable)
    final dayNames = [
      'Lunes',
      'Martes',
      'Miércoles',
      'Jueves',
      'Viernes',
      'Sábado',
      'Domingo',
    ];

    // DateTime.weekday devuelve 1-7 (Monday-Sunday)
    return dayNames[date.weekday - 1];
  }

  String _getWeatherIcon(String iconCode) {
    return AppConstants.weatherIcons[iconCode] ?? '☀️';
  }
}
