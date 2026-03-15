import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:investment_fund/core/util/constants.dart';
import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/util/simulate_sale.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:investment_fund/core/model/investment_record_model.dart';
import 'package:investment_fund/core/data/provider/global_controller.dart';
import 'package:investment_fund/feature/investment_detail/ui/widgets/insufficient_funds_dialog.dart';
import 'package:investment_fund/feature/investment_detail/provider/model/investment_detail_state.dart';

part 'investment_detail_controller.g.dart';

@riverpod
class InvestmentDetailController extends _$InvestmentDetailController {
  @override
  FutureOr<InvestmentDetailState> build() => InvestmentDetailState.init();

  GlobalController get globalController =>
      ref.read(globalControllerProvider.notifier);

  Future<void> initPage(FundModel fund) async {
    _setState(state.value!.copyWith(fund: fund));
    ref.listen(globalControllerProvider, (previous, next) {
      if (next.value != null) {
        _setState(state.value!.copyWith(user: next.value!.user));
      }
    }, fireImmediately: true);
  }

  void setSelectedTab(String tab) {
    final current = state.value ?? InvestmentDetailState.init();
    state = AsyncValue.data(current.copyWith(selectedTab: tab));
  }

  void setSelectedTimeRange(String range) {
    final current = state.value ?? InvestmentDetailState.init();
    state = AsyncValue.data(current.copyWith(selectedTimeRange: range));
  }

  void buyAction(BuildContext context) {
    final currentState = state.value;
    if (currentState == null) return;

    final availableBalance = currentState.user.availableBalance.toDouble();
    final minInvestment = currentState.fund.minInvestment.toDouble();

    if (availableBalance < minInvestment) {
      _showInsufficientFundsDialog(context);
      return;
    }

    final newInvestmentRecord = InvestmentRecordsModel(
      isSell: false,
      date: DateTime.now(),
      fundId: currentState.fund.id,
      id: currentState.user.investmentRecords.length + 1,
      price: currentState.fund.minInvestment,
    );

    final newUser = currentState.user.copyWith(
      availableBalance: (availableBalance - minInvestment).toInt(),
      investments: [
        ...currentState.user.investments,
        currentState.fund.id.toString(),
      ],
      investmentRecords: [
        ...currentState.user.investmentRecords,
        newInvestmentRecord,
      ],
    );

    globalController.setNewUser(newUser);
  }

  void sellAction(BuildContext context) {
    final amount = state.value!.fund.minInvestment.toDouble();
    final sellAmount = simulateSell(amount);

    if (sellAmount < amount) {
      _acceptToSell(sellAmount);
      _showLossesDialog(
        context,
        amount: amount,
        newAmount: sellAmount,
        onAccept: () => context.pop(),
      );
    } else {
      _acceptToSell(sellAmount);
      _successToSellDialog(
        context,
        amount: amount,
        newAmount: sellAmount,
        onAccept: () => context.pop(),
      );
    }
  }

  void _acceptToSell(double sellAmount) {
    final investments = state.value!.user.investments;
    investments.remove(state.value!.fund.id.toString());
    final investmentRecords = state.value!.user.investmentRecords;
    final purchasePrice = state.value!.fund.minInvestment;

    final newAvailableBalance = state.value!.user.availableBalance + sellAmount;

    final newInvestmentRecord = InvestmentRecordsModel(
      isSell: true,
      date: DateTime.now(),
      fundId: state.value!.fund.id,
      id: investmentRecords.length + 1,
      price: sellAmount.toInt(),
      purchasePrice: purchasePrice,
    );

    final newUser = state.value!.user.copyWith(
      investments: investments,
      availableBalance: newAvailableBalance.toInt(),
      investmentRecords: [...investmentRecords, newInvestmentRecord],
    );

    globalController.setNewUser(newUser);
  }

  void _showLossesDialog(
    BuildContext context, {
    required double amount,
    required double newAmount,
    required VoidCallback onAccept,
  }) {
    InsufficientFundsDialog.show(
      context,
      title: lossesTitle,
      onAccept: onAccept,
      color: AppColors.error,
      message: lossesMessage(amount, newAmount),
      icon: Icons.account_balance_wallet_outlined,
    );
  }

  void _successToSellDialog(
    BuildContext context, {
    required double amount,
    required double newAmount,
    required VoidCallback onAccept,
  }) {
    InsufficientFundsDialog.show(
      context,
      title: successToSellTitle,
      onAccept: onAccept,
      color: AppColors.warning,
      icon: Icons.account_balance_wallet_outlined,
      message: successToSellMessage(amount, newAmount),
    );
  }

  void _showInsufficientFundsDialog(BuildContext context) {
    InsufficientFundsDialog.show(
      context,
      color: AppColors.error,
      onAccept: () =>context.pop(),
      title: insufficientFundsTitle,
      message: insufficientFundsMessage,
      icon: Icons.account_balance_wallet_outlined,
    );
  }

  void _setState(InvestmentDetailState newState) {
    state = AsyncValue.data(newState);
  }
}
