import '../../../weather/domain/repositories/weather_repository.dart';
import '../entities/favorite_entities.dart';
import '../../../weather/domain/entities/weather_entities.dart';

abstract class FavoritesRepository {
  Future<Result<List<FavoriteEventEntity>>> getAllFavorites();
  Future<Result<void>> addToFavorites(WeatherEvent event);
  Future<Result<void>> removeFromFavorites(String eventId);
  Future<Result<bool>> isFavorite(String eventId);
  Future<Result<void>> clearAllFavorites();

  // Cache methods
  Future<Result<void>> cacheWeatherData(String key, String data, Duration ttl);
  Future<Result<String?>> getCachedWeatherData(String key);
  Future<Result<void>> clearExpiredCache();
}
