import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/feature/splash/provider/splash_controller.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final provider = ref.read(splashControllerProvider.notifier);
      provider.handeldToLoadingApp(() => context.go('/lobby'));
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(splashControllerProvider).value!;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Lottie.asset(
              'assets/lottie/smartphone.json',
              fit: BoxFit.contain,
              width: state.logoWidth,
              height: state.logoHeight,
            ),
          ],
        ),
      ),
    );
  }
}
