import 'package:investment_fund/core/model/fund_model.dart';

abstract class GlobalApiInterface {
  Future<List<FundModel>> getInvestmentsFunds();
}
