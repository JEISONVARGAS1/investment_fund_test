import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadingPage({super.key, required this.child, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Stack(
        children: [
          child,
          Container(
            color: Colors.black.withOpacity(0.5),
            child: const Center(child: _AnimatedLoaderImage()),
          ),
        ],
      );
    }
    return child;
  }
}

class _AnimatedLoaderImage extends StatefulWidget {
  const _AnimatedLoaderImage();

  @override
  State<_AnimatedLoaderImage> createState() => _AnimatedLoaderImageState();
}

class _AnimatedLoaderImageState extends State<_AnimatedLoaderImage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.7, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Image.asset(
        'assets/icons/Loader.png',
        width: 80,
        height: 80,
        fit: BoxFit.contain,
      ),
    );
  }
}


