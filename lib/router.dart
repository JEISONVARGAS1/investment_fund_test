import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/core/widget/page_not_found.dart';
import 'package:investment_fund/feature/home/ui/home_page.dart';
import 'package:investment_fund/feature/investment_detail/ui/investment_detail_page.dart';
import 'package:investment_fund/feature/lobby/ui/lobby_page.dart';
import 'package:investment_fund/feature/splash/ui/splash_page.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  const initialLocation = '/splash';

  return GoRouter(
    initialLocation: initialLocation,
    errorBuilder: (context, state) => PageNotFound(state: state),
    routes: [
      GoRoute(
        name: 'splash',
        path: '/splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: 'lobby',
        path: '/lobby',
        pageBuilder: (context, state) => buildPageWithTransition(LobbyPage()),
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        pageBuilder: (context, state) => buildPageWithTransition(HomePage()),
      ),
      GoRoute(
        name: 'investment_detail',
        path: '/investment/:assetName',
        pageBuilder: (context, state) {
          final assetName = state.pathParameters['assetName'] ?? 'Apple';
          return buildPageWithTransition(
            InvestmentDetailPage(assetName: assetName),
          );
        },
      ),

      GoRoute(
        name: '404',
        path: '/404',
        builder: (context, state) => PageNotFound(state: state),
      ),
    ],
  );
});

Page<dynamic> buildPageWithTransition(Widget child) {
  return CustomTransitionPage(
    transitionDuration: const Duration(milliseconds: 1000),
    key: ValueKey(child.hashCode),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
