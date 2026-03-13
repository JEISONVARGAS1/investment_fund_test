import 'dart:math' as math;
import 'package:investment_fund/core/model/start_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:investment_fund/feature/splash/provider/model/splash_state.dart';

part 'splash_controller.g.dart';

@riverpod
class SplashController extends _$SplashController {
  @override
  FutureOr<SplashState> build() => SplashState.init();

  List<StarData> generateStars() {
    final random = math.Random(42);
    return List.generate(50, (i) {
      return StarData(
        x: random.nextDouble(),
        y: random.nextDouble(),
        size: 2.0 + random.nextDouble() * 6, // 2-8px
        phase: random.nextDouble(),
      );
    });
  }
}
