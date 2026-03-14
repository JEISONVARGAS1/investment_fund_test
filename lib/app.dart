import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:investment_fund/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/core/theme/app_theme.dart';
import 'package:investment_fund/l10n/app_localizations.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GoRouter routes = ref.watch(goRouterProvider);
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return AppErrorWidget(error: details);
    };

    return Builder(
      builder: (context) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: routes,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          localeResolutionCallback: (locale, supportedLocales) {
            for (final supported in supportedLocales) {
              if (supported.languageCode == locale?.languageCode) {
                return supported;
              }
            }
            return const Locale('es');
          },
        );
      },
    );
  }
}

class AppErrorWidget extends StatelessWidget {
  final FlutterErrorDetails? error;

  const AppErrorWidget({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .all(16),
      color: Colors.orangeAccent,
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Text(
            AppLocalizations.of(context)?.errorOops ?? 'Oops!',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)?.errorSomethingWentWrong ??
                'Sorry, something went wrong',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            '${error?.exception}\n',
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
