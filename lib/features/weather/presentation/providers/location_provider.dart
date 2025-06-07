import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/features/weather/presentation/providers/weather_provider.dart';

import '../../../../shared/providers/dependency_injection.dart';
import '../../domain/entities/weather_entities.dart';
import '../../domain/repositories/weather_repository.dart';
import 'weather_state.dart';

part 'location_provider.g.dart';

@riverpod
class LocationSearchNotifier extends _$LocationSearchNotifier {
  late WeatherRepository _repository;

  @override
  LocationState build() {
    _repository = ref.read(weatherRepositoryProvider);
    return const LocationState();
  }

  Future<void> searchLocations(String query) async {
    if (query.trim().isEmpty) {
      state = state.copyWith(searchResults: []);
      return;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final result = await _repository.searchLocations(query);

      result.when(
        success: (locations) {
          state = state.copyWith(
            isLoading: false,
            searchResults: locations,
            error: null,
          );
        },
        error: (failure) {
          state = state.copyWith(isLoading: false, error: failure);
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: const Failure.unknown(message: 'Error buscando ubicaciones'),
      );
    }
  }

  void selectLocation(LocationInfo location) {
    state = state.copyWith(selectedLocation: location, searchResults: []);
  }

  void clearSearch() {
    state = state.copyWith(
      searchResults: [],
      selectedLocation: null,
      error: null,
    );
  }
}

// Provider for the currently selected location
@riverpod
LocationInfo? selectedLocation(ref) {
  final locationState = ref.watch(locationSearchNotifierProvider);
  final weatherState = ref.watch(weatherNotifierProvider);

  return locationState.selectedLocation ?? weatherState.currentLocation;
}
