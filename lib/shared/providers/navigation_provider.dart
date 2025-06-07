import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_provider.g.dart';

enum NavigationTab { home, favorites, settings }

@riverpod
class NavigationNotifier extends _$NavigationNotifier {
  @override
  NavigationTab build() {
    return NavigationTab.home;
  }

  void setTab(NavigationTab tab) {
    state = tab;
  }
}

// Provider for checking current tab
@riverpod
bool isCurrentTab(ref, NavigationTab tab) {
  final currentTab = ref.watch(navigationNotifierProvider);
  return currentTab == tab;
}
