import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:investment_fund/core/data/provider/global_controller.dart';
import 'package:investment_fund/feature/home/provider/model/home_state.dart';

part 'stock_controller.g.dart';

@riverpod
class StockController extends _$StockController {
  @override
  FutureOr<HomeState> build() => HomeState.init();

  Future<void> initPage() async {
    ref.listen(globalControllerProvider, (previous, next) {
      if (next.value != null) {
        _setState(
          state.value!.copyWith(
            investmentsFunds: next.value!.investmentsFunds,
            filteredInvestmentsFunds: next.value!.investmentsFunds,
          ),
        );
      }
    }, fireImmediately: true);
  }

  void searchInvestmentsFunds(String query) {
    final value = query.trim();
    final investmentsFunds = state.value!.investmentsFunds;
    if (value.isEmpty) {
      _setState(
        state.value!.copyWith(filteredInvestmentsFunds: investmentsFunds),
      );
      return;
    }
    final filteredInvestmentsFunds = investmentsFunds
        .where((fund) => fund.name.toLowerCase().contains(value.toLowerCase()))
        .toList();

    _setState(
      state.value!.copyWith(filteredInvestmentsFunds: filteredInvestmentsFunds),
    );
  }

  void _setState(HomeState newState) => state = AsyncValue.data(newState);
}
