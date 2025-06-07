import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/location_provider.dart';
import '../providers/weather_provider.dart';

class LocationSearchBar extends ConsumerStatefulWidget {
  const LocationSearchBar({super.key});

  @override
  ConsumerState<LocationSearchBar> createState() => _LocationSearchBarState();
}

class _LocationSearchBarState extends ConsumerState<LocationSearchBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showSuggestions = false;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locationState = ref.watch(locationSearchNotifierProvider);
    final weatherState = ref.watch(weatherNotifierProvider);

    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText:
                          weatherState.currentLocation?.name ??
                          'Buscar ubicación...',
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon:
                          _controller.text.isNotEmpty
                              ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: _clearSearch,
                              )
                              : null,
                    ),
                    onChanged: _onSearchChanged,
                    onSubmitted: _onSearchSubmitted,
                    onTap: () {
                      setState(() {
                        _showSuggestions = true;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.my_location),
                  onPressed: _getCurrentLocation,
                ),
              ],
            ),
          ),
        ),

        // Search Results
        if (_showSuggestions && locationState.searchResults.isNotEmpty)
          Card(
            margin: const EdgeInsets.only(top: 4),
            child: Column(
              children:
                  locationState.searchResults.map((location) {
                    return ListTile(
                      leading: const Icon(Icons.location_on),
                      title: Text(location.name),
                      subtitle: Text('${location.region}, ${location.country}'),
                      onTap: () => _selectLocation(location),
                    );
                  }).toList(),
            ),
          ),

        // Loading indicator
        if (locationState.isLoading)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
      ],
    );
  }

  void _onSearchChanged(String value) {
    if (value.trim().isNotEmpty) {
      ref.read(locationSearchNotifierProvider.notifier).searchLocations(value);
      setState(() {
        _showSuggestions = true;
      });
    } else {
      ref.read(locationSearchNotifierProvider.notifier).clearSearch();
      setState(() {
        _showSuggestions = false;
      });
    }
  }

  void _onSearchSubmitted(String value) {
    if (value.trim().isNotEmpty) {
      ref.read(locationSearchNotifierProvider.notifier).searchLocations(value);
    }
    _focusNode.unfocus();
  }

  void _selectLocation(location) {
    _controller.text = location.name;
    ref.read(locationSearchNotifierProvider.notifier).selectLocation(location);
    ref.read(weatherNotifierProvider.notifier).setLocation(location);

    setState(() {
      _showSuggestions = false;
    });
    _focusNode.unfocus();
  }

  void _clearSearch() {
    _controller.clear();
    ref.read(locationSearchNotifierProvider.notifier).clearSearch();
    setState(() {
      _showSuggestions = false;
    });
  }

  void _getCurrentLocation() {
    ref.read(weatherNotifierProvider.notifier).getCurrentLocation();
    _clearSearch();
  }
}
