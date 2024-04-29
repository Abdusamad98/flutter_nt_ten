class NetworkResponse {
  dynamic data;
  String errorText;
  int statusCode;

  NetworkResponse({
    this.data,
    this.errorText = '',
    this.statusCode = 0,
  });
}
