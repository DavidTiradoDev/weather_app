class AppConfig {
  static const String appName = 'Weather App';
  static const String appVersion = '1.0.0';

  // API Configuration
  static const String baseUrl =
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services';
  static const String apiKey = 'CMK6VVPKGM2XQX3SHUJ9NSBDJ';

  // Flavor Configuration
  static const String flavor = String.fromEnvironment(
    'FLAVOR',
    defaultValue: 'dev',
  );
  static bool get isDev => flavor == 'dev';
  static bool get isProd => flavor == 'prod';

  // App specific configs based on flavor
  static String get displayName {
    switch (flavor) {
      case 'prod':
        return 'Weather App';
      case 'dev':
      default:
        return 'Weather App Dev';
    }
  }
}
