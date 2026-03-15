import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:investment_fund/core/model/user_model.dart';

part 'profile_state.freezed.dart';

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState({
    required UserModel user,
    @Default(false) bool isLoading,
  }) = ProfileStateData;

  factory ProfileState.init() => ProfileState(user: UserModel.init());
}
