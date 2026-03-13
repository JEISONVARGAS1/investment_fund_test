import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageNotFound extends StatelessWidget {
  final GoRouterState state;

  const PageNotFound({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '404 - Page not found Page: $state',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
