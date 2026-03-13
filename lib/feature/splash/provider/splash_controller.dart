import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:investment_fund/feature/splash/provider/model/splash_state.dart';

part 'splash_controller.g.dart';

@riverpod
class SplashController extends _$SplashController {
  @override
  FutureOr<SplashState> build() => SplashState.init();

  void handeldToLoadingApp(Function() onComplete) async {
    await Future.delayed(const Duration(seconds: 2));
    onComplete();
  }
}
