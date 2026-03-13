import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
  import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/core/model/start_data.dart';
import 'package:investment_fund/feature/home/provider/home_controller.dart';
import 'package:investment_fund/feature/splash/provider/splash_controller.dart';
import 'package:investment_fund/feature/splash/ui/widget/star_painter.dart';

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
      _navigateToOnboarding();
    });
  }

  void _navigateToOnboarding() {
    if (!mounted) return;
    context.go('/lobby');
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(splashControllerProvider).value!;
    final provider = ref.read(splashControllerProvider.notifier);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: _AnimatedStarsBackground(
              stars: provider.generateStars(),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/Loader_splash.png',
                    fit: BoxFit.contain,
                    width: state.logoWidth,
                    height: state.logoHeight,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedStarsBackground extends StatefulWidget {
  final List<StarData> stars;

  const _AnimatedStarsBackground({required this.stars});

  @override
  State<_AnimatedStarsBackground> createState() =>
      _AnimatedStarsBackgroundState();
}

class _AnimatedStarsBackgroundState extends State<_AnimatedStarsBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0B132B),
      child: CustomPaint(
        painter: StarsPainter(animation: _controller, stars: widget.stars),
        size: Size.infinite,
      ),
    );
  }
}
