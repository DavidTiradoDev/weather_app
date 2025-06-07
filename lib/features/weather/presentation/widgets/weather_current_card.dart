import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/weather_entities.dart';
import '../../../../core/constants/app_constants.dart';

class WeatherCurrentCard extends ConsumerWidget {
  final WeatherCurrent weather;

  const WeatherCurrentCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weather.location,
                        style: Theme.of(context).textTheme.titleLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _formatDate(weather.datetime),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  _getWeatherIcon(weather.icon),
                  style: const TextStyle(fontSize: 48),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${weather.temperature.round()}°C',
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _translateCondition(weather.conditions),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Sensación: ${weather.feelsLike.round()}°C',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildWeatherDetail(
                      'Humedad',
                      '${weather.humidity.round()}%',
                    ),
                    _buildWeatherDetail(
                      'Viento',
                      '${weather.windSpeed.round()} km/h',
                    ),
                    _buildWeatherDetail(
                      'Presión',
                      '${weather.pressure.round()} hPa',
                    ),
                    _buildWeatherDetail(
                      'UV',
                      weather.uvIndex.toStringAsFixed(1),
                    ),
                    _buildWeatherDetail(
                      'Visibilidad',
                      '${weather.visibility.round()} km',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    final now = DateTime.now();
    if (dateTime.day == now.day &&
        dateTime.month == now.month &&
        dateTime.year == now.year) {
      return 'Hoy, ${DateFormat('HH:mm').format(dateTime)}';
    }
    return DateFormat('dd MMM, HH:mm', 'es').format(dateTime);
  }

  String _getWeatherIcon(String iconCode) {
    return AppConstants.weatherIcons[iconCode] ?? '☀️';
  }

  String _translateCondition(String condition) {
    final lowerCondition = condition.toLowerCase();

    for (final entry in AppConstants.weatherConditionsSpanish.entries) {
      if (lowerCondition.contains(entry.key)) {
        return entry.value;
      }
    }

    return condition; // Return original if no translation found
  }
}
