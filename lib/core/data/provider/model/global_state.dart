import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:investment_fund/core/model/fund_model.dart';

part 'global_state.freezed.dart';

@freezed
sealed class GlobalState with _$GlobalState {
  const factory GlobalState({@Default([]) List<FundModel> investmentsFunds}) =
      GlobalStateData;

  factory GlobalState.init() => GlobalState();
}
