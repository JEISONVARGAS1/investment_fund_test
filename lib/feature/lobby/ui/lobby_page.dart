import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/core/widget/loading_page.dart';
import 'package:investment_fund/feature/home/ui/home_page.dart';
import 'package:investment_fund/feature/lobby/provider/lobby_controller.dart';
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
  Widget build(BuildContext context) {
    final state = ref.watch(lobbyControllerProvider).value!;

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
                children: const [
                  HomePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
