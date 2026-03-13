import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:investment_fund/feature/lobby/provider/model/lobby_state.dart';

part 'lobby_controller.g.dart';

@riverpod
class LobbyController extends _$LobbyController {
  @override
  FutureOr<LobbyState> build() => LobbyState.init();

  Future<void> initPage() async {}

  changeIndexPage(int index) =>
      _setState(state.value!.copyWith(indexPage: index));

  void _setState(LobbyState newState) => state = AsyncValue.data(newState);
}
