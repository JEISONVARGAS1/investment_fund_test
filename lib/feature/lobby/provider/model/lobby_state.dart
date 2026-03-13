import 'package:freezed_annotation/freezed_annotation.dart';

part 'lobby_state.freezed.dart';

@freezed
sealed class LobbyState with _$LobbyState {
  const factory LobbyState({
    @Default(0) int indexPage,
    @Default(false) bool isLoading,
  }) = LobbyStateData;

  factory LobbyState.init() => LobbyState();
}
