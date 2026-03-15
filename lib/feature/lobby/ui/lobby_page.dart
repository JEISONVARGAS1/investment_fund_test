import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/core/widget/loading_page.dart';
import 'package:investment_fund/feature/home/ui/home_page.dart';
import 'package:investment_fund/feature/stocks/ui/stocks_page.dart';
import 'package:investment_fund/feature/profile/ui/profile_page.dart';
import 'package:investment_fund/core/extension/context_extension.dart';
import 'package:investment_fund/feature/lobby/provider/lobby_controller.dart';
import 'package:investment_fund/feature/lobby/ui/widget/custom_bottom_navigation.dart';
import 'package:investment_fund/feature/lobby/ui/widget/custom_navigation_rail.dart';

class LobbyPage extends ConsumerStatefulWidget {
  const LobbyPage({super.key});

  @override
  ConsumerState<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends ConsumerState<LobbyPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => ref.read(lobbyControllerProvider.notifier).initPage(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(lobbyControllerProvider).value!;
    final provider = ref.read(lobbyControllerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: LoadingPage(
        isLoading: state.isLoading,
        child: context.isDesktop
            ? Row(
                children: [
                  CustomNavigationRail(
                    user: state.user,
                    selectedIndex: state.indexPage,
                    onDestinationSelected: provider.handledChangeIndexPage,
                  ),
                  Expanded(
                    child: PageView(
                      controller: state.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: provider.handledChangeIndexPage,
                      children: const [
                        HomePage(),
                        StocksPage(),
                        ProfilePage(),
                      ],
                    ),
                  ),
                ],
              )
            : PageView(
                controller: state.pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: provider.handledChangeIndexPage,
                children: const [
                  HomePage(),
                  StocksPage(),
                  ProfilePage(),
                ],
              ),
      ),
      bottomNavigationBar: context.isDesktop
          ? null
          : CustomBottomNavigation(
              currentIndex: state.indexPage,
              onTap: provider.handledChangeIndexPage,
            ),
    );
  }
}
