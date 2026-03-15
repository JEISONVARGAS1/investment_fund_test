import 'package:investment_fund/core/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:investment_fund/core/data/provider/model/global_state.dart';
import 'package:investment_fund/core/data/repositories/global_repository.dart';

part 'global_controller.g.dart';

@riverpod
class GlobalController extends _$GlobalController {
  @override
  Future<GlobalState> build() async {
    ref.keepAlive();
    getUser();
    getInvestmentsFunds();
    return GlobalState.init();
  }

  GlobalRepositoryInterface get repository =>
      ref.read(globalRepositoryProvider);

  Future<void> getInvestmentsFunds() async {
    final res = await repository.getInvestmentsFunds();

    if (res.isSuccessful) {
      if (state.value != null) {
        _setState(state.value!.copyWith(investmentsFunds: res.data!));
      } else {
        _setState(GlobalState.init().copyWith(investmentsFunds: res.data!));
      }
    }
  }

  Future<void> getUser() async {
    final res = await repository.getUser();
    if (res.isSuccessful) {
      _setState(state.value!.copyWith(user: res.data!));
    }
  }

  void setNewUser(UserModel user) =>
      _setState(state.value!.copyWith(user: user));

  void _setState(GlobalState newState) => state = AsyncValue.data(newState);
}
