import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../weather/domain/entities/weather_entities.dart';

part 'favorite_entities.freezed.dart';

@freezed
class FavoriteEventEntity with _$FavoriteEventEntity {
  const factory FavoriteEventEntity({
    required String id,
    required String type,
    required String title,
    required String description,
    required DateTime startTime,
    DateTime? endTime,
    required String severity,
    required double latitude,
    required double longitude,
    required DateTime addedAt,
    @Default(true) bool isFavorite,
  }) = _FavoriteEventEntity;

  // Convertir de WeatherEvent a FavoriteEventEntity
  factory FavoriteEventEntity.fromWeatherEvent(WeatherEvent event) {
    return FavoriteEventEntity(
      id: event.id,
      type: event.type,
      title: event.title,
      description: event.description,
      startTime: event.startTime,
      endTime: event.endTime,
      severity: event.severity,
      latitude: event.latitude,
      longitude: event.longitude,
      addedAt: DateTime.now(),
    );
  }
}

// Extensión para convertir de vuelta a WeatherEvent
extension FavoriteEventEntityX on FavoriteEventEntity {
  WeatherEvent toWeatherEvent() {
    return WeatherEvent(
      id: id,
      type: type,
      title: title,
      description: description,
      startTime: startTime,
      endTime: endTime,
      severity: severity,
      latitude: latitude,
      longitude: longitude,
      isFavorite: true,
    );
  }
}
