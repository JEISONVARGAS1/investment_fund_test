import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/model/user_model.dart';

part 'investment_detail_state.freezed.dart';

@freezed
sealed class InvestmentDetailState with _$InvestmentDetailState {
  const factory InvestmentDetailState({
    required UserModel user,
    required FundModel fund,
    @Default(false) bool isLoading,
    @Default('Overview') String selectedTab,
    @Default('5D') String selectedTimeRange,
  }) = InvestmentDetailStateData;

  factory InvestmentDetailState.init() =>
      InvestmentDetailState(user: UserModel.init(), fund: FundModel.init());
}
