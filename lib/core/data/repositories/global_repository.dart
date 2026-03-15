import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/data/data/global_api.dart';
import 'package:investment_fund/core/model/query_response_model.dart';
import 'package:investment_fund/core/data/data/global_api_interface.dart';
import 'package:investment_fund/core/model/user_model.dart';

abstract class GlobalRepositoryInterface {
  Future<QueryResponseModel<UserModel>> getUser();
  Future<QueryResponseModel<List<FundModel>>> getInvestmentsFunds();
}

class _GlobalApiRepository implements GlobalRepositoryInterface {
  final GlobalApiInterface _globalApi;

  _GlobalApiRepository(GlobalApiInterface globalApi) : _globalApi = globalApi;

  @override
  Future<QueryResponseModel<List<FundModel>>> getInvestmentsFunds() async {
    try {
      final res = await _globalApi.getInvestmentsFunds();
      return QueryResponseModel(data: res);
    } catch (e) {
      return QueryResponseModel(
        isSuccessful: false,
        exceptionCode: e.toString(),
      );
    }
  }

  @override
  Future<QueryResponseModel<UserModel>> getUser() async {
    try {
      final res = await _globalApi.getUser();
      return QueryResponseModel(data: res);
    } catch (e) {
      return QueryResponseModel(
        isSuccessful: false,
        exceptionCode: e.toString(),
      );
    }
  }
}

final globalRepositoryProvider = Provider<GlobalRepositoryInterface>(
  (Ref ref) => _GlobalApiRepository(ref.read(globalApiProvider)),
);
