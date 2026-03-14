  import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:investment_fund/core/model/fund_model.dart';

part 'stock_state.freezed.dart';

@freezed
sealed class StockState with _$StockState {
  const factory StockState({
    @Default(false) bool isLoading,
    @Default([]) List<FundModel> investmentsFunds,
    @Default([]) List<FundModel> filteredInvestmentsFunds,
  }) = StockStateData;

  factory StockState.init() => const StockState();
}
