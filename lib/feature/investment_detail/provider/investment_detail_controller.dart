import 'package:investment_fund/feature/investment_detail/provider/model/investment_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'investment_detail_controller.g.dart';

@riverpod
class InvestmentDetailController extends _$InvestmentDetailController {
  @override
  FutureOr<InvestmentDetailState> build() {
    return InvestmentDetailState.init();
  }

  void setSelectedTab(String tab) {
    final current = state.value ?? InvestmentDetailState.init();
    state = AsyncValue.data(current.copyWith(selectedTab: tab));
  }

  void setSelectedTimeRange(String range) {
    final current = state.value ?? InvestmentDetailState.init();
    state = AsyncValue.data(current.copyWith(selectedTimeRange: range));
  }
}
