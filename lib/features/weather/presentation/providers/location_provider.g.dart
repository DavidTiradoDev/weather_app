// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedLocationHash() => r'3dbdb24b4e4c6b874d831a5732b4c36d55b43324';

/// See also [selectedLocation].
@ProviderFor(selectedLocation)
final selectedLocationProvider = AutoDisposeProvider<LocationInfo?>.internal(
  selectedLocation,
  name: r'selectedLocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SelectedLocationRef = AutoDisposeProviderRef<LocationInfo?>;
String _$locationSearchNotifierHash() =>
    r'db26a8448eb4cb5e6f66d1c714173a859343fc5b';

/// See also [LocationSearchNotifier].
@ProviderFor(LocationSearchNotifier)
final locationSearchNotifierProvider =
    AutoDisposeNotifierProvider<LocationSearchNotifier, LocationState>.internal(
  LocationSearchNotifier.new,
  name: r'locationSearchNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationSearchNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocationSearchNotifier = AutoDisposeNotifier<LocationState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
