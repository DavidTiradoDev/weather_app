import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_provider.g.dart';

@riverpod
Stream<ConnectivityResult> connectivityStream(ConnectivityStreamRef ref) {
  return Connectivity().onConnectivityChanged;
}

@riverpod
class ConnectivityNotifier extends _$ConnectivityNotifier {
  @override
  bool build() {
    // Listen to connectivity changes
    ref.listen(connectivityStreamProvider, (previous, next) {
      next.when(
        data: (connectivityResult) {
          state = connectivityResult != ConnectivityResult.none;
        },
        error: (error, stackTrace) {
          state = false;
        },
        loading: () {
          // Keep current state during loading
        },
      );
    });

    // Initialize with current connectivity state
    _checkInitialConnectivity();
    return true; // Default to connected
  }

  Future<void> _checkInitialConnectivity() async {
    try {
      final result = await Connectivity().checkConnectivity();
      state = result != ConnectivityResult.none;
    } catch (e) {
      state = false;
    }
  }

  void setConnectivity(bool isConnected) {
    state = isConnected;
  }
}

// Computed provider to get connection status
@riverpod
bool isConnected(IsConnectedRef ref) {
  return ref.watch(connectivityNotifierProvider);
}
