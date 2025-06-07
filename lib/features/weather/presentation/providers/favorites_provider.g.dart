// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoriteEventIdsHash() => r'e17b0673da7f227999f6c00714f722cf49693f19';

/// See also [favoriteEventIds].
@ProviderFor(favoriteEventIds)
final favoriteEventIdsProvider = AutoDisposeProvider<Set<String>>.internal(
  favoriteEventIds,
  name: r'favoriteEventIdsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteEventIdsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FavoriteEventIdsRef = AutoDisposeProviderRef<Set<String>>;
String _$isEventFavoriteHash() => r'd4bb7c792ed70c37727d1cdb6e78525eeea58db4';

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
class IsEventFavoriteFamily extends Family<bool> {
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
class IsEventFavoriteProvider extends AutoDisposeProvider<bool> {
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
    bool Function(IsEventFavoriteRef provider) create,
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
  AutoDisposeProviderElement<bool> createElement() {
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
mixin IsEventFavoriteRef on AutoDisposeProviderRef<bool> {
  /// The parameter `eventId` of this provider.
  String get eventId;
}

class _IsEventFavoriteProviderElement extends AutoDisposeProviderElement<bool>
    with IsEventFavoriteRef {
  _IsEventFavoriteProviderElement(super.provider);

  @override
  String get eventId => (origin as IsEventFavoriteProvider).eventId;
}

String _$isEventFavoriteAsyncHash() =>
    r'e96da5ecf678009d21e14382e3db377875e14a4e';

/// See also [isEventFavoriteAsync].
@ProviderFor(isEventFavoriteAsync)
const isEventFavoriteAsyncProvider = IsEventFavoriteAsyncFamily();

/// See also [isEventFavoriteAsync].
class IsEventFavoriteAsyncFamily extends Family<AsyncValue<bool>> {
  /// See also [isEventFavoriteAsync].
  const IsEventFavoriteAsyncFamily();

  /// See also [isEventFavoriteAsync].
  IsEventFavoriteAsyncProvider call(
    String eventId,
  ) {
    return IsEventFavoriteAsyncProvider(
      eventId,
    );
  }

  @override
  IsEventFavoriteAsyncProvider getProviderOverride(
    covariant IsEventFavoriteAsyncProvider provider,
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
  String? get name => r'isEventFavoriteAsyncProvider';
}

/// See also [isEventFavoriteAsync].
class IsEventFavoriteAsyncProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [isEventFavoriteAsync].
  IsEventFavoriteAsyncProvider(
    String eventId,
  ) : this._internal(
          (ref) => isEventFavoriteAsync(
            ref as IsEventFavoriteAsyncRef,
            eventId,
          ),
          from: isEventFavoriteAsyncProvider,
          name: r'isEventFavoriteAsyncProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isEventFavoriteAsyncHash,
          dependencies: IsEventFavoriteAsyncFamily._dependencies,
          allTransitiveDependencies:
              IsEventFavoriteAsyncFamily._allTransitiveDependencies,
          eventId: eventId,
        );

  IsEventFavoriteAsyncProvider._internal(
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
    FutureOr<bool> Function(IsEventFavoriteAsyncRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsEventFavoriteAsyncProvider._internal(
        (ref) => create(ref as IsEventFavoriteAsyncRef),
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
    return _IsEventFavoriteAsyncProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsEventFavoriteAsyncProvider && other.eventId == eventId;
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
mixin IsEventFavoriteAsyncRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `eventId` of this provider.
  String get eventId;
}

class _IsEventFavoriteAsyncProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with IsEventFavoriteAsyncRef {
  _IsEventFavoriteAsyncProviderElement(super.provider);

  @override
  String get eventId => (origin as IsEventFavoriteAsyncProvider).eventId;
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
