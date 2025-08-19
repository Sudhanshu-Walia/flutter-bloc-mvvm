part 'data_response.g.dart';

class ResponseWrapper<TModel> {
  String? token;
  bool? encrypted;
  int? response;
  String? errorMessage;
  TModel? data;
  String? msg;

  ResponseWrapper({
    this.response,
    this.token,
    this.encrypted,
    this.errorMessage,
    this.data,
    this.msg,
  });

  factory ResponseWrapper.fromJson(
    Map<String, dynamic> json,
    TModel Function(Object? json) fromJsonT,
  ) =>
      _$ResponseWrapperFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(TModel value) toJsonT) =>
      _$ResponseWrapperToJson(this, toJsonT);
}
