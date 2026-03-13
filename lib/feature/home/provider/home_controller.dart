import 'dart:async';
import 'package:investment_fund/core/data/provider/global_controller.dart';
import 'package:investment_fund/feature/home/data/home_api.dart';
import 'package:investment_fund/feature/home/provider/model/home_state.dart';
import 'package:investment_fund/feature/home/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<HomeState> build() {
    return HomeState.init();
  }

  HomeRepository get api => ref.read(homeRepositoryProvider);

  Future<void> initPage() async {}

  void _setState(HomeState newState) => state = AsyncValue.data(newState);
}
