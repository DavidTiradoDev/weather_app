import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/weather_entities.dart';
import '../providers/favorites_provider.dart';
import '../../../../core/constants/app_constants.dart';

class WeatherEventsCard extends ConsumerWidget {
  final List<WeatherEvent> events;

  const WeatherEventsCard({super.key, required this.events});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (events.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Icon(Icons.check_circle, size: 48, color: Colors.green),
              const SizedBox(height: 8),
              Text(
                'No hay eventos climáticos',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Text(
                'Todo se ve bien por ahora',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Eventos Climáticos',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (events.length > 2)
                  TextButton(
                    onPressed: () {
                      _showAllEvents(context, events);
                    },
                    child: const Text('Ver más'),
                  ),
              ],
            ),
            const SizedBox(height: 12),

            ...events
                .take(2)
                .map((event) => _buildEventItem(context, ref, event)),
          ],
        ),
      ),
    );
  }

  Widget _buildEventItem(
    BuildContext context,
    WidgetRef ref,
    WeatherEvent event,
  ) {
    // 🔥 CAMBIO: Manejo seguro de errores
    bool isFavorite = false;
    try {
      isFavorite = ref.watch(isEventFavoriteProvider(event.id));
    } catch (e) {
      // En caso de error, asumir que no es favorito
      isFavorite = false;
    }

    return InkWell(
      onTap: () {
        _showEventDetail(context, event);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _getSeverityColor(event.severity).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getEventIcon(event.type),
                color: _getSeverityColor(event.severity),
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    event.description,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _formatEventTime(event),
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                InkWell(
                  onTap: () {
                    ref
                        .read(favoritesNotifierProvider.notifier)
                        .toggleFavorite(event);
                  },
                  // 🔥 CAMBIO CLAVE: Ya no usamos .when() porque no es Future
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 16,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showEventDetail(BuildContext context, WeatherEvent event) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(event.title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.description),
                const SizedBox(height: 16),
                Text('Tipo: ${_translateEventType(event.type)}'),
                Text('Severidad: ${_translateSeverity(event.severity)}'),
                Text(
                  'Inicio: ${DateFormat('dd/MM/yyyy HH:mm').format(event.startTime)}',
                ),
                if (event.endTime != null)
                  Text(
                    'Fin: ${DateFormat('dd/MM/yyyy HH:mm').format(event.endTime!)}',
                  ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cerrar'),
              ),
            ],
          ),
    );
  }

  void _showAllEvents(BuildContext context, List<WeatherEvent> events) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder:
          (context) => DraggableScrollableSheet(
            initialChildSize: 0.7,
            maxChildSize: 0.9,
            minChildSize: 0.5,
            builder:
                (context, scrollController) => Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'Todos los Eventos Climáticos',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: events.length,
                          itemBuilder:
                              (context, index) => Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Consumer(
                                    builder:
                                        (context, ref, child) =>
                                            _buildEventItem(
                                              context,
                                              ref,
                                              events[index],
                                            ),
                                  ),
                                ),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
          ),
    );
  }

  String _formatEventTime(WeatherEvent event) {
    final now = DateTime.now();
    final eventDate = event.startTime;

    if (eventDate.day == now.day &&
        eventDate.month == now.month &&
        eventDate.year == now.year) {
      return DateFormat('HH:mm').format(eventDate);
    }

    return DateFormat('dd/MM HH:mm').format(eventDate);
  }

  IconData _getEventIcon(String type) {
    switch (type.toLowerCase()) {
      case 'wind':
        return Icons.air;
      case 'rain':
        return Icons.water_drop;
      case 'snow':
        return Icons.ac_unit;
      case 'storm':
        return Icons.flash_on;
      case 'hail':
        return Icons.grain;
      case 'tornado':
        return Icons.cyclone;
      case 'earthquake':
        return Icons.landscape;
      default:
        return Icons.warning;
    }
  }

  Color _getSeverityColor(String severity) {
    final colorValue = AppConstants.severityColors[severity.toLowerCase()];
    return colorValue != null ? Color(colorValue) : Colors.orange;
  }

  String _translateEventType(String type) {
    return AppConstants.eventTypesSpanish[type.toLowerCase()] ?? type;
  }

  String _translateSeverity(String severity) {
    switch (severity.toLowerCase()) {
      case 'minor':
        return 'Menor';
      case 'moderate':
        return 'Moderado';
      case 'severe':
        return 'Severo';
      case 'extreme':
        return 'Extremo';
      default:
        return severity;
    }
  }
}
