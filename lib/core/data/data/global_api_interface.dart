import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/model/user_model.dart';

abstract class GlobalApiInterface {
  Future<UserModel> getUser();
  Future<List<FundModel>> getInvestmentsFunds();
}
