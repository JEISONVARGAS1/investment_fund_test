import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
sealed class SplashState with _$SplashState {
  const factory SplashState({
    @Default(500) double logoWidth,
    @Default(500) double logoHeight,
  }) = SplashStateData;

  factory SplashState.init() => SplashState();
}
