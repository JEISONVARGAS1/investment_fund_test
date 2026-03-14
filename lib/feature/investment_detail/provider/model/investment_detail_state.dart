import 'package:freezed_annotation/freezed_annotation.dart';

part 'investment_detail_state.freezed.dart';

@freezed
sealed class InvestmentDetailState with _$InvestmentDetailState {
  const factory InvestmentDetailState({
    @Default(false) bool isLoading,
    @Default('Overview') String selectedTab,
    @Default('5D') String selectedTimeRange,
  }) = InvestmentDetailStateData;

  factory InvestmentDetailState.init() => const InvestmentDetailState();
}
