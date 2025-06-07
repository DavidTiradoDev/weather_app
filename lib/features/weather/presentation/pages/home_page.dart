import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/favorites/presentation/pages/home_page.dart';
import '../providers/weather_provider.dart';
import '../../../../shared/providers/connectivity_provider.dart';
import '../widgets/weather_current_card.dart';
import '../widgets/weather_forecast_list.dart';
import '../widgets/location_search_bar.dart';
import '../widgets/weather_events_card.dart';
import '../widgets/connectivity_banner.dart';
import '../widgets/error_widget.dart';
import '../widgets/loading_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    // Load initial data when the page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(weatherNotifierProvider.notifier).refreshWeatherData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(weatherNotifierProvider);
    final isConnected = ref.watch(connectivityNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(weatherState.currentLocation?.name ?? 'Clima'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              _navigateToFavorites();
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(weatherNotifierProvider.notifier).refreshWeatherData();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(weatherNotifierProvider.notifier).refreshWeatherData();
        },
        child: CustomScrollView(
          slivers: [
            // Connectivity Banner
            if (!isConnected)
              const SliverToBoxAdapter(child: ConnectivityBanner()),

            // Error Banner
            if (weatherState.error != null)
              SliverToBoxAdapter(
                child: WeatherErrorWidget(
                  error: weatherState.error!,
                  onRetry: () {
                    ref.read(weatherNotifierProvider.notifier).clearError();
                    ref
                        .read(weatherNotifierProvider.notifier)
                        .refreshWeatherData();
                  },
                ),
              ),

            // Main Content
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Location Search
                  const LocationSearchBar(),
                  const SizedBox(height: 16),

                  // Current Weather
                  if (weatherState.isLoading)
                    const WeatherLoadingWidget()
                  else if (weatherState.currentWeather != null)
                    WeatherCurrentCard(weather: weatherState.currentWeather!)
                  else
                    _buildEmptyWeatherCard(),

                  const SizedBox(height: 16),

                  // Weather Events
                  if (weatherState.isLoadingEvents)
                    const WeatherLoadingWidget()
                  else
                    WeatherEventsCard(events: weatherState.events),

                  const SizedBox(height: 16),

                  // 5 Day Forecast
                  const Text(
                    'Pronóstico de 5 días',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  if (weatherState.isLoadingForecast)
                    const WeatherLoadingWidget()
                  else if (weatherState.forecast != null)
                    WeatherForecastList(forecast: weatherState.forecast!)
                  else
                    _buildEmptyForecastCard(),

                  const SizedBox(height: 100), // Bottom padding
                ]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(weatherNotifierProvider.notifier).getCurrentLocation();
        },
        child: const Icon(Icons.my_location),
      ),
    );
  }

  Widget _buildEmptyWeatherCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const Icon(Icons.wb_sunny, size: 48, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              'Obtén el clima',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Toca el botón de ubicación para obtener el clima actual',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyForecastCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const Icon(Icons.calendar_today, size: 48, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              'Pronóstico no disponible',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Selecciona una ubicación para ver el pronóstico',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToFavorites() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const FavoritesPage()));
  }
}
