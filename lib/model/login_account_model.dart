class EmailLoginRespones {
  EmailLoginRespones({
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

  factory EmailLoginRespones.fromJson(Map<String, dynamic> json) =>
      EmailLoginRespones(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        error: json["error"] ?? false,
        refreshToken: json["refreshToken"],
      );
}