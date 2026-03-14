import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/core/widget/loading_page.dart';
import 'package:investment_fund/feature/home/ui/home_page.dart';
import 'package:investment_fund/feature/profile/ui/profile_page.dart';
import 'package:investment_fund/feature/stocks/ui/stocks_page.dart';
import 'package:investment_fund/feature/lobby/provider/lobby_controller.dart';
import 'package:investment_fund/feature/lobby/ui/widget/custom_bottom_navigation.dart';

class LobbyPage extends ConsumerStatefulWidget {
  const LobbyPage({super.key});

  @override
  ConsumerState<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends ConsumerState<LobbyPage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => ref.read(lobbyControllerProvider.notifier).initPage(),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    ref.read(lobbyControllerProvider.notifier).changeIndexPage(index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
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
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: provider.changeIndexPage,
                children: const [
                  HomePage(),
                  StocksPage(),
                  _PlaceholderPage(title: 'Noticias'),
                  ProfilePage(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        onTap: _onItemTapped,
        currentIndex: state.indexPage,
      ),
    );
  }
}

class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }
}
