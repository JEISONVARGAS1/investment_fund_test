import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:investment_fund/core/extension/context_extension.dart';
import 'package:investment_fund/feature/lobby/provider/model/lobby_state.dart';

part 'lobby_controller.g.dart';

@riverpod
class LobbyController extends _$LobbyController {
  @override
  FutureOr<LobbyState> build() {
    ref.onDispose(disposePageController);
    return LobbyState.init();
  }

  Future<void> initPage(BuildContext context) async {
    _setState(state.value!.copyWith(isDesktop: context.isDesktop));
  }

  void disposePageController() {
    state.value!.pageController.dispose();
  }

  void handledChangeIndexPage(int index) {
    _setState(state.value!.copyWith(indexPage: index));
    state.value!.pageController.jumpToPage(index);
  }

  void _setState(LobbyState newState) => state = AsyncValue.data(newState);
}
