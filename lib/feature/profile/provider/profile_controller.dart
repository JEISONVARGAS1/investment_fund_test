import 'package:investment_fund/core/data/provider/global_controller.dart';
import 'package:investment_fund/feature/profile/provider/model/profile_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<ProfileState> build() => ProfileState.init();

  Future<void> initPage() async {
    ref.listen(globalControllerProvider, (previous, next) {
      if (next.value != null) {
        _setState(state.value!.copyWith(user: next.value!.user));
      }
    }, fireImmediately: true);
  }

  void _setState(ProfileState newState) => state = AsyncValue.data(newState);
}
