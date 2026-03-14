import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:investment_fund/core/extension/context_extension.dart';
import 'package:investment_fund/feature/home/provider/model/home_state.dart';
import 'package:investment_fund/feature/home/repositories/home_repository.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<HomeState> build() {
    return HomeState.init();
  }

  HomeRepository get api => ref.read(homeRepositoryProvider);

  Future<void> initPage(BuildContext context) async {
    _setState(state.value!.copyWith(isDesktop: context.isDesktop));
  }

  void _setState(HomeState newState) => state = AsyncValue.data(newState);
}
