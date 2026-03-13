import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'models/run_state.dart';

abstract class OnStartService {
  Future<void> init();
}

final onStartProvider = StateNotifierProvider<OnStartNotifier, AppRunState>(
  (Ref ref) => OnStartNotifier(),
);

class OnStartNotifier extends StateNotifier<AppRunState> {
  final List<OnStartService> _services;

  OnStartNotifier()
      : _services = [],
        super(const AppRunState.loading());

  void register(OnStartService service) {
    _services.add(service);
  }

  void onEnded() {
    state = const AppRunState.ready();
  }

  void printDebugState() {
    debugPrint('OnStartNotifier state');
    for (final el in _services) {
      debugPrint(' - ${el.runtimeType} started');
    }
  }
}
