class EmailCreateAccountResponse {
  bool? status;
  String? id;
  String? messege;
  bool ? error;
  EmailCreateAccountResponse({
    this.status,
    this.id,
    this.messege,
    this.error,
  });
  factory EmailCreateAccountResponse.fromjsom(Map<String, dynamic> json) =>
      EmailCreateAccountResponse(
        status: json["status"],
        id: json["id"],
        messege: json["messege"],
        error: json["error"]??false,
      );
}
