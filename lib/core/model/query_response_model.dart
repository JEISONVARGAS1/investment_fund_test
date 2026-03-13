import 'package:investment_fund/core/error/exceptions.dart';

class QueryResponseModel<T> {
  final T? data;
  final bool isSuccessful;
  final ExceptionCode exceptionCode;

  QueryResponseModel({
    this.data,
    ExceptionCode? exceptionCode,
    this.isSuccessful = true,
  }) : exceptionCode = exceptionCode ??
          ExceptionCode(
            message: '',
            errorType: TypeErrorException.ERROR,
          );

  QueryResponseModel<T> copyWith({
    T? data,
    bool? isSuccessful,
    ExceptionCode? exceptionCode,
  }) {
    return QueryResponseModel<T>(
      data: data ?? this.data,
      isSuccessful: isSuccessful ?? this.isSuccessful,
      exceptionCode: exceptionCode ?? this.exceptionCode,
    );
  }
}
