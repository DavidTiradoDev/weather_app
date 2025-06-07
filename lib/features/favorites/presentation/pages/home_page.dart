import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/weather/presentation/providers/weather_state.dart';
import '../../../weather/presentation/providers/favorites_provider.dart';
import '../../../weather/domain/entities/weather_entities.dart';
import '../../../../core/constants/app_constants.dart';
import 'package:weather_app/core/errors/failures.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesState = ref.watch(favoritesNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos Favoritos'),
        actions: [
          if (favoritesState.favoriteEvents.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              onPressed: () => _showClearAllDialog(context, ref),
              tooltip: 'Limpiar todos',
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(favoritesNotifierProvider.notifier).refreshFavorites();
        },
        child: _buildBody(context, ref, favoritesState),
      ),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, FavoritesState state) {
    if (state.isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Cargando favoritos...'),
          ],
        ),
      );
    }

    if (state.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
            const SizedBox(height: 16),
            Text(
              'Error cargando favoritos',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              state.error!.userMessage,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(favoritesNotifierProvider.notifier).clearError();
                ref.read(favoritesNotifierProvider.notifier).refreshFavorites();
              },
              child: const Text('Reintentar'),
            ),
          ],
        ),
      );
    }

    if (state.favoriteEvents.isEmpty) {
      return _buildEmptyState(context);
    }

    return _buildFavoritesList(context, ref, state.favoriteEvents);
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No tienes eventos favoritos',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Agrega eventos a favoritos tocando el ❤️ en la pantalla principal',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Volver al inicio'),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritesList(
    BuildContext context,
    WidgetRef ref,
    List<WeatherEvent> favorites,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final event = favorites[index];
        return _buildFavoriteCard(context, ref, event);
      },
    );
  }

  Widget _buildFavoriteCard(
    BuildContext context,
    WidgetRef ref,
    WeatherEvent event,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _getSeverityColor(event.severity).withValues(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _getEventIcon(event.type),
                    color: _getSeverityColor(event.severity),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _translateSeverity(event.severity),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: _getSeverityColor(event.severity),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () => _removeFavorite(context, ref, event),
                  tooltip: 'Quitar de favoritos',
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              event.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  _formatEventDateTime(event),
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
                const Spacer(),
                Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  '${event.latitude.toStringAsFixed(2)}, ${event.longitude.toStringAsFixed(2)}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _removeFavorite(
    BuildContext context,
    WidgetRef ref,
    WeatherEvent event,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Quitar de favoritos'),
            content: Text(
              '¿Estás seguro de que quieres quitar "${event.title}" de tus favoritos?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  ref
                      .read(favoritesNotifierProvider.notifier)
                      .removeFromFavorites(event.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${event.title} removido de favoritos'),
                      action: SnackBarAction(
                        label: 'Deshacer',
                        onPressed: () {
                          ref
                              .read(favoritesNotifierProvider.notifier)
                              .addToFavorites(event);
                        },
                      ),
                    ),
                  );
                },
                child: const Text('Quitar'),
              ),
            ],
          ),
    );
  }

  void _showClearAllDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Limpiar todos los favoritos'),
            content: const Text(
              '¿Estás seguro de que quieres quitar todos los eventos de favoritos?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  ref
                      .read(favoritesNotifierProvider.notifier)
                      .clearAllFavorites();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Todos los favoritos fueron removidos'),
                    ),
                  );
                },
                child: const Text('Limpiar todo'),
              ),
            ],
          ),
    );
  }

  String _formatEventDateTime(WeatherEvent event) {
    final startFormat = DateFormat('dd/MM/yyyy HH:mm');
    String result = startFormat.format(event.startTime);

    if (event.endTime != null) {
      final endFormat = DateFormat('HH:mm');
      result += ' - ${endFormat.format(event.endTime!)}';
    }

    return result;
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
