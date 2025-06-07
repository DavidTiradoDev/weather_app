import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/weather/presentation/pages/home_page.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_config.dart';
import 'shared/providers/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies
  await DependencyInjection.init();
  final sharedPreferences = await SharedPreferences.getInstance();

  // Create provider container with dependencies
  final container = DependencyInjection.createContainer(sharedPreferences);

  runApp(
    UncontrolledProviderScope(container: container, child: const WeatherApp()),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
