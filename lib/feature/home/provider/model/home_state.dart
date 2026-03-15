import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/model/user_model.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    required UserModel user,
    @Default(false) bool isLoading,
    @Default([]) List<FundModel> investmentsFunds,
    @Default([]) List<FundModel> myInvestmentsFunds,
    @Default([]) List<FundModel> filteredInvestmentsFunds,
    @Default([]) List<FundModel> myFilteredInvestmentsFunds,
  }) = HomeStateData;

  factory HomeState.init() => HomeState(user: UserModel.init());
}
