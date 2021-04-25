class WrappedResponse<T>{
  final T data;
  final ApiResultHeader header;

  WrappedResponse({required this.data,required this.header});
}


class ApiResultHeader {
  final bool? isSuccessful;
  final int? resultCode;
  final String? resultMessage;

  ApiResultHeader(
      {required this.isSuccessful,required this.resultCode,required this.resultMessage});
}