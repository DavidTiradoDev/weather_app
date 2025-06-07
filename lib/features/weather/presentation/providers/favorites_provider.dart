import 'package:weather_app/core/errors/failures.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/features/favorites/domain/repositories/favorites_repositories.dart';

import '../../../../shared/providers/dependency_injection.dart';
import '../../domain/entities/weather_entities.dart';
import '../../domain/repositories/weather_repository.dart';
import '../../../favorites/domain/entities/favorite_entities.dart';
import 'weather_state.dart';

part 'favorites_provider.g.dart';

@riverpod
class FavoritesNotifier extends _$FavoritesNotifier {
  late FavoritesRepository _repository;

  @override
  FavoritesState build() {
    _repository = ref.read(favoritesRepositoryProvider);

    // Inicializar el estado inmediatamente sin llamar a _loadFavorites
    final initialState = const FavoritesState();

    // Programar la carga de favoritos para después del build
    Future.microtask(() => _loadFavorites());

    return initialState;
  }

  Future<void> _loadFavorites() async {
    // Verificar que el provider esté activo antes de actualizar el estado
    if (!ref.exists(favoritesNotifierProvider)) return;

    state = state.copyWith(isLoading: true);

    try {
      final result = await _repository.getAllFavorites();

      // Verificar nuevamente que el provider esté activo
      if (!ref.exists(favoritesNotifierProvider)) return;

      result.when(
        success: (favorites) {
          // Convertir FavoriteEventEntity a WeatherEvent para la UI
          final weatherEvents =
              favorites.map((favorite) => favorite.toWeatherEvent()).toList();

          state = state.copyWith(
            isLoading: false,
            favoriteEvents: weatherEvents,
            error: null,
          );
        },
        error: (failure) {
          state = state.copyWith(isLoading: false, error: failure);
        },
      );
    } catch (e) {
      if (!ref.exists(favoritesNotifierProvider)) return;

      state = state.copyWith(
        isLoading: false,
        error: const Failure.cache(message: 'Error cargando favoritos'),
      );
    }
  }

  Future<void> addToFavorites(WeatherEvent event) async {
    try {
      final result = await _repository.addToFavorites(event);

      result.when(
        success: (_) {
          // Recargar favoritos
          _loadFavorites();
        },
        error: (failure) {
          state = state.copyWith(error: failure);
        },
      );
    } catch (e) {
      state = state.copyWith(
        error: const Failure.cache(message: 'Error agregando a favoritos'),
      );
    }
  }

  Future<void> removeFromFavorites(String eventId) async {
    try {
      final result = await _repository.removeFromFavorites(eventId);

      result.when(
        success: (_) {
          // Recargar favoritos
          _loadFavorites();
        },
        error: (failure) {
          state = state.copyWith(error: failure);
        },
      );
    } catch (e) {
      state = state.copyWith(
        error: const Failure.cache(message: 'Error removiendo de favoritos'),
      );
    }
  }

  Future<bool> isFavorite(String eventId) async {
    try {
      final result = await _repository.isFavorite(eventId);
      return result.when(success: (isFav) => isFav, error: (_) => false);
    } catch (e) {
      return false;
    }
  }

  Future<void> toggleFavorite(WeatherEvent event) async {
    final isFav = await isFavorite(event.id);

    if (isFav) {
      await removeFromFavorites(event.id);
    } else {
      await addToFavorites(event);
    }
  }

  Future<void> clearAllFavorites() async {
    try {
      final result = await _repository.clearAllFavorites();

      result.when(
        success: (_) {
          state = state.copyWith(favoriteEvents: []);
        },
        error: (failure) {
          state = state.copyWith(error: failure);
        },
      );
    } catch (e) {
      state = state.copyWith(
        error: const Failure.cache(message: 'Error limpiando favoritos'),
      );
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void refreshFavorites() {
    _loadFavorites();
  }
}

// Reemplaza COMPLETAMENTE los providers al final de tu favorites_provider.dart

// Provider que mantiene un Set de IDs de favoritos con tipo explícito
@riverpod
Set<String> favoriteEventIds(ref) {
  final favoritesState = ref.watch(favoritesNotifierProvider);

  // Crear un Set<String> explícitamente tipado
  final Set<String> favoriteIds = <String>{};

  for (final event in favoritesState.favoriteEvents) {
    // Convertir a String de manera segura
    final String eventId = event.id.toString();
    if (eventId.isNotEmpty) {
      favoriteIds.add(eventId);
    }
  }

  return favoriteIds;
}

@riverpod
bool isEventFavorite(ref, String eventId) {
  try {
    final Set<String> favoriteIds = ref.watch(favoriteEventIdsProvider);
    return favoriteIds.contains(eventId);
  } catch (e) {
    // En caso de error, asumir que no es favorito
    return false;
  }
}

// ALTERNATIVA: Si prefieres mantener el comportamiento async original
@riverpod
Future<bool> isEventFavoriteAsync(ref, String eventId) async {
  try {
    final favoritesNotifier = ref.read(favoritesNotifierProvider.notifier);
    return await favoritesNotifier.isFavorite(eventId);
  } catch (e) {
    return false;
  }
}
