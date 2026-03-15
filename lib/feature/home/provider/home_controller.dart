import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:investment_fund/core/data/provider/global_controller.dart';
import 'package:investment_fund/feature/home/provider/model/home_state.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<HomeState> build() => HomeState.init();

  Future<void> initPage() async {
    ref.listen(globalControllerProvider, (previous, next) {
      if (next.value != null) {
        _setState(
          state.value!.copyWith(
            user: next.value!.user,
            investmentsFunds: next.value!.investmentsFunds,
            filteredInvestmentsFunds: next.value!.investmentsFunds,
          ),
        );
        _findMyInvestmentsFunds();
      }
    }, fireImmediately: true);
  }

  void searchInvestmentsFunds(String query) {
    final value = query.trim();
    final investmentsFunds = state.value!.investmentsFunds;
    final myInvestmentsFunds = state.value!.myInvestmentsFunds;

    if (value.isEmpty) {
      _setState(
        state.value!.copyWith(
          filteredInvestmentsFunds: investmentsFunds,
          myFilteredInvestmentsFunds: myInvestmentsFunds,
        ),
      );
      return;
    }

    final filteredInvestmentsFunds = investmentsFunds
        .where((fund) => fund.name.toLowerCase().contains(value.toLowerCase()))
        .toList();

    final myFilteredInvestmentsFunds = myInvestmentsFunds
        .where((fund) => fund.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
        
    _setState(
      state.value!.copyWith(
        filteredInvestmentsFunds: filteredInvestmentsFunds,
        myFilteredInvestmentsFunds: myFilteredInvestmentsFunds,
      ),
    );
  }

  void _findMyInvestmentsFunds() {
    final myInvestmentsId = state.value!.user.investments;
    final investmentsFunds = state.value!.investmentsFunds;

    final myInvestmentsFunds = investmentsFunds
        .where((fund) => myInvestmentsId.contains(fund.id.toString()))
        .toList();

    _setState(
      state.value!.copyWith(
        myInvestmentsFunds: myInvestmentsFunds,
        myFilteredInvestmentsFunds: myInvestmentsFunds,
      ),
    );
  }

  void _setState(HomeState newState) => state = AsyncValue.data(newState);
}
