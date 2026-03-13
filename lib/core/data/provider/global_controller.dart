import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:investment_fund/core/data/provider/model/global_state.dart';

part 'global_controller.g.dart';

@riverpod
class GlobalController extends _$GlobalController {
  @override
  Future<GlobalState> build() async {
    ref.keepAlive();
   return  GlobalState.init();
  }


  void _setState(GlobalState newState) => state = AsyncValue.data(newState);
}
