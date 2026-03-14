import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:investment_fund/core/data/provider/model/global_state.dart';
import 'package:investment_fund/core/data/repositories/global_repository.dart';

part 'global_controller.g.dart';

@riverpod
class GlobalController extends _$GlobalController {
  @override
  Future<GlobalState> build() async {
    ref.keepAlive();
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

  void _setState(GlobalState newState) => state = AsyncValue.data(newState);
}
