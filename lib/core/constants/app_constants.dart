class AppConstants {
  // API Constants

  static const String apiKey = 'CMK6VVPKGM2XQX3SHUJ9NSBDJ';
  static const String baseUrl =
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services';

  // API Endpoints
  static const String timelineEndpoint = '/timeline';

  // Units and Language
  static const String units = 'metric';
  static const String language = 'es';

  // Cache Keys
  static const String currentWeatherCacheKey = 'current_weather';
  static const String forecastCacheKey = 'forecast_weather';
  static const String eventsCacheKey = 'weather_events';
  static const String favoriteEventsCacheKey = 'favorite_events';
  static const String lastLocationCacheKey = 'last_location';

  // Cache Duration
  static const Duration cacheDuration = Duration(minutes: 15);

  // Location
  static const double defaultLatitude = 6.2442; // Medellín
  static const double defaultLongitude = -75.5812;
  static const String defaultLocationName = 'Medellín, Colombia';

  // Weather Icons Mapping
  static const Map<String, String> weatherIcons = {
    'clear-day': '☀️',
    'clear-night': '🌙',
    'partly-cloudy-day': '⛅',
    'partly-cloudy-night': '☁️',
    'cloudy': '☁️',
    'rain': '🌧️',
    'snow': '❄️',
    'wind': '💨',
    'fog': '🌫️',
    'thunderstorm': '⛈️',
    'hail': '🧊',
    'tornado': '🌪️',
  };

  // Event Severity Colors
  static const Map<String, int> severityColors = {
    'minor': 0xFF4CAF50, // Green
    'moderate': 0xFFFF9800, // Orange
    'severe': 0xFFF44336, // Red
    'extreme': 0xFF9C27B0, // Purple
  };

  // Spanish Translations
  static const Map<String, String> weatherConditionsSpanish = {
    'clear': 'Despejado',
    'sunny': 'Soleado',
    'partly-cloudy': 'Parcialmente nublado',
    'cloudy': 'Nublado',
    'overcast': 'Muy nublado',
    'rain': 'Lluvia',
    'drizzle': 'Llovizna',
    'heavy-rain': 'Lluvia fuerte',
    'snow': 'Nieve',
    'sleet': 'Aguanieve',
    'wind': 'Ventoso',
    'fog': 'Niebla',
    'thunderstorm': 'Tormenta eléctrica',
    'hail': 'Granizo',
    'tornado': 'Tornado',
  };

  // Event Types Spanish
  static const Map<String, String> eventTypesSpanish = {
    'wind': 'Viento fuerte',
    'rain': 'Lluvia intensa',
    'snow': 'Nevadas',
    'storm': 'Tormenta',
    'hail': 'Granizo',
    'tornado': 'Tornado',
    'earthquake': 'Terremoto',
    'flood': 'Inundación',
    'fire': 'Incendio',
  };
}
