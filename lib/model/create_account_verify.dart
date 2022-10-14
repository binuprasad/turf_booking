class EmailOTPResponse {
  EmailOTPResponse({
    this.status,
    this.message,
    this.token,
    this.error,
    this.refreshToken,
  });
  bool? error;
  bool? status;
  String? message;
  String? token;
  String? refreshToken;

  factory EmailOTPResponse.fromJson(Map<String, dynamic> json) =>
      EmailOTPResponse(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        error: json["error"]??false,
        refreshToken: json["refreshToken"],
      );
}