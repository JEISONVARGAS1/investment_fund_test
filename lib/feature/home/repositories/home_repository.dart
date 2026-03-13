import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/feature/home/data/home_api.dart';
import 'package:investment_fund/feature/home/data/home_api_interface.dart';

abstract class HomeRepository {}

class _HomeRepository implements HomeRepository {
  final HomeApiInterface _homeApi;

  _HomeRepository(HomeApiInterface homeApi) : _homeApi = homeApi;
}

final homeRepositoryProvider = Provider<HomeRepository>(
  (Ref ref) => _HomeRepository(ref.read(homeApiProvider)),
);
