import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
sealed class SplashState with _$SplashState {
  const factory SplashState({
    @Default(300) double logoWidth,
    @Default(300) double logoHeight,
  }) = SplashStateData;

  factory SplashState.init() => SplashState();
}
