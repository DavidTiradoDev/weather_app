// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isCurrentTabHash() => r'06b7db4f97fbe4f2653aad00e2178dab56f7c976';

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

/// See also [isCurrentTab].
@ProviderFor(isCurrentTab)
const isCurrentTabProvider = IsCurrentTabFamily();

/// See also [isCurrentTab].
class IsCurrentTabFamily extends Family<bool> {
  /// See also [isCurrentTab].
  const IsCurrentTabFamily();

  /// See also [isCurrentTab].
  IsCurrentTabProvider call(
    NavigationTab tab,
  ) {
    return IsCurrentTabProvider(
      tab,
    );
  }

  @override
  IsCurrentTabProvider getProviderOverride(
    covariant IsCurrentTabProvider provider,
  ) {
    return call(
      provider.tab,
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
  String? get name => r'isCurrentTabProvider';
}

/// See also [isCurrentTab].
class IsCurrentTabProvider extends AutoDisposeProvider<bool> {
  /// See also [isCurrentTab].
  IsCurrentTabProvider(
    NavigationTab tab,
  ) : this._internal(
          (ref) => isCurrentTab(
            ref as IsCurrentTabRef,
            tab,
          ),
          from: isCurrentTabProvider,
          name: r'isCurrentTabProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isCurrentTabHash,
          dependencies: IsCurrentTabFamily._dependencies,
          allTransitiveDependencies:
              IsCurrentTabFamily._allTransitiveDependencies,
          tab: tab,
        );

  IsCurrentTabProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tab,
  }) : super.internal();

  final NavigationTab tab;

  @override
  Override overrideWith(
    bool Function(IsCurrentTabRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsCurrentTabProvider._internal(
        (ref) => create(ref as IsCurrentTabRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tab: tab,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _IsCurrentTabProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsCurrentTabProvider && other.tab == tab;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tab.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IsCurrentTabRef on AutoDisposeProviderRef<bool> {
  /// The parameter `tab` of this provider.
  NavigationTab get tab;
}

class _IsCurrentTabProviderElement extends AutoDisposeProviderElement<bool>
    with IsCurrentTabRef {
  _IsCurrentTabProviderElement(super.provider);

  @override
  NavigationTab get tab => (origin as IsCurrentTabProvider).tab;
}

String _$navigationNotifierHash() =>
    r'60ccad2314e8f2ee958a56c8d8b10d8dbac62c00';

/// See also [NavigationNotifier].
@ProviderFor(NavigationNotifier)
final navigationNotifierProvider =
    AutoDisposeNotifierProvider<NavigationNotifier, NavigationTab>.internal(
  NavigationNotifier.new,
  name: r'navigationNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$navigationNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NavigationNotifier = AutoDisposeNotifier<NavigationTab>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
