import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lobby_state.freezed.dart';

@freezed
sealed class LobbyState with _$LobbyState {
  const factory LobbyState({
    @Default(0) int indexPage,
    @Default(false) bool isLoading,
    @Default(false) bool isDesktop,
    required PageController pageController,
  }) = LobbyStateData;

  factory LobbyState.init() =>
      LobbyState(pageController: PageController(initialPage: 0));
}
