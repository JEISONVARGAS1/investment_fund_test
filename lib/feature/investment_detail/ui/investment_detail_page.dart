import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/feature/investment_detail/ui/widgets/detail_tabs.dart';
import 'package:investment_fund/feature/investment_detail/ui/widgets/detail_app_bar.dart';
import 'package:investment_fund/feature/investment_detail/ui/widgets/detail_info_card.dart';
import 'package:investment_fund/feature/investment_detail/ui/widgets/detail_action_buttons.dart';
import 'package:investment_fund/feature/investment_detail/ui/widgets/detail_candlestick_chart.dart';

class InvestmentDetailPage extends ConsumerStatefulWidget {
  final String? assetName;

  const InvestmentDetailPage({super.key, this.assetName});

  @override
  ConsumerState<InvestmentDetailPage> createState() =>
      _InvestmentDetailPageState();
}

class _InvestmentDetailPageState extends ConsumerState<InvestmentDetailPage> {
  @override
  Widget build(BuildContext context) {
    final assetName = widget.assetName ?? 'Apple';

    return Scaffold(
      appBar: DetailAppBar(title: assetName),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailTabs(
                      tabs: const [
                        'Overview',
                        'Ideas',
                        'Index component',
                        'Technicals',
                      ],
                    ),
                    const DetailCandlestickChart(),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: DetailInfoCard(
                        title: 'Overview',
                        price: '\$ 230.00',
                        icon: Icons.apple,
                      ),
                    ),
                    const DetailActionButtons(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
