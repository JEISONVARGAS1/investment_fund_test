import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/feature/home/data/home_api_interface.dart';

class _HomeApi extends HomeApiInterface {
  _HomeApi();
}

final homeApiProvider = Provider<HomeApiInterface>((Ref ref) => _HomeApi());
