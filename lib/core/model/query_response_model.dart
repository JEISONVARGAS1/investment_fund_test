class QueryResponseModel<T> {
  final T? data;
  final bool isSuccessful;
  final String exceptionCode;

  QueryResponseModel({
    this.data,
    String? exceptionCode,
    this.isSuccessful = true,
  }) : exceptionCode = exceptionCode ?? '';

  QueryResponseModel<T> copyWith({
    T? data,
    bool? isSuccessful,
    String? exceptionCode,
  }) {
    return QueryResponseModel<T>(
      data: data ?? this.data,
      isSuccessful: isSuccessful ?? this.isSuccessful,
      exceptionCode: exceptionCode ?? this.exceptionCode,
    );
  }
}
