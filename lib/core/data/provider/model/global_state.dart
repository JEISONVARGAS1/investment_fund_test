import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_state.freezed.dart';

@freezed
sealed class GlobalState with _$GlobalState {
  const factory GlobalState({
    @Default([]) List<String> pokemonListFavorites,
  }) = GlobalStateData;

  factory GlobalState.init() => GlobalState();
}
