import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:investment_fund/core/model/user_model.dart';

part 'lobby_state.freezed.dart';

@freezed
sealed class LobbyState with _$LobbyState {
  const factory LobbyState({
    required UserModel user,
    @Default(0) int indexPage,
    @Default(false) bool isLoading,
    required PageController pageController,
  }) = LobbyStateData;

  factory LobbyState.init() => LobbyState(
    user: UserModel.init(),
    pageController: PageController(initialPage: 0),
  );
}
