import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/core/model/user_model.dart';
import 'package:investment_fund/core/util/constants.dart';
import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/data/data/global_api_interface.dart';

class _GlobalApi extends GlobalApiInterface {
  _GlobalApi();

  @override
  Future<List<FundModel>> getInvestmentsFunds() async {
    await Future.delayed(const Duration(seconds: 2));
    final res = fundTypes;
    return res;
  }

  @override
  Future<UserModel> getUser() async {
    await Future.delayed(const Duration(seconds: 2));
    final res = UserModel(
      id: 1,
      investments: [],
      currency: 'COP',
      investmentRecords: [],
      name: 'Jeison Manuel',
      initialBalance: 500000,
      availableBalance: 500000,
      email: 'manuelvargasvargas10@gmail.com',
    );
    return res;
  }
}

final globalApiProvider = Provider<GlobalApiInterface>(
  (Ref ref) => _GlobalApi(),
);
