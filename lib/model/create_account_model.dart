class EmailSignupRespones {
  EmailSignupRespones({
    this.status,
    this.id,
    this.message,
    this.error,
  });

  bool? error;
  bool? status;
  String? id;
  String? message;

  factory EmailSignupRespones.fromJson(Map<String, dynamic> json) =>
      EmailSignupRespones(
        status: json["status"],
        id: json["id"],
        message: json["message"],
        error: json["error"] ?? false,
      );
}