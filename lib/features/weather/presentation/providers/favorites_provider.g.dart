// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isEventFavoriteHash() => r'04203da22ae6429c558547f4186fb505ff2094e5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [isEventFavorite].
@ProviderFor(isEventFavorite)
const isEventFavoriteProvider = IsEventFavoriteFamily();

/// See also [isEventFavorite].
class IsEventFavoriteFamily extends Family<AsyncValue<bool>> {
  /// See also [isEventFavorite].
  const IsEventFavoriteFamily();

  /// See also [isEventFavorite].
  IsEventFavoriteProvider call(
    String eventId,
  ) {
    return IsEventFavoriteProvider(
      eventId,
    );
  }

  @override
  IsEventFavoriteProvider getProviderOverride(
    covariant IsEventFavoriteProvider provider,
  ) {
    return call(
      provider.eventId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isEventFavoriteProvider';
}

/// See also [isEventFavorite].
class IsEventFavoriteProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [isEventFavorite].
  IsEventFavoriteProvider(
    String eventId,
  ) : this._internal(
          (ref) => isEventFavorite(
            ref as IsEventFavoriteRef,
            eventId,
          ),
          from: isEventFavoriteProvider,
          name: r'isEventFavoriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isEventFavoriteHash,
          dependencies: IsEventFavoriteFamily._dependencies,
          allTransitiveDependencies:
              IsEventFavoriteFamily._allTransitiveDependencies,
          eventId: eventId,
        );

  IsEventFavoriteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventId,
  }) : super.internal();

  final String eventId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(IsEventFavoriteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsEventFavoriteProvider._internal(
        (ref) => create(ref as IsEventFavoriteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eventId: eventId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _IsEventFavoriteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsEventFavoriteProvider && other.eventId == eventId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IsEventFavoriteRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `eventId` of this provider.
  String get eventId;
}

class _IsEventFavoriteProviderElement
    extends AutoDisposeFutureProviderElement<bool> with IsEventFavoriteRef {
  _IsEventFavoriteProviderElement(super.provider);

  @override
  String get eventId => (origin as IsEventFavoriteProvider).eventId;
}

String _$favoritesNotifierHash() => r'5983d3a49cafff669ea7b5132615b331a2843278';

/// See also [FavoritesNotifier].
@ProviderFor(FavoritesNotifier)
final favoritesNotifierProvider =
    AutoDisposeNotifierProvider<FavoritesNotifier, FavoritesState>.internal(
  FavoritesNotifier.new,
  name: r'favoritesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoritesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoritesNotifier = AutoDisposeNotifier<FavoritesState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
