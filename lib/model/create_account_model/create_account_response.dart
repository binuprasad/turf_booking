import 'dart:convert';

CreateAccountResponse createAccountResponseFromJson(String str) =>
    CreateAccountResponse.fromJson(json.decode(str));

String createAccountResponseToJson(CreateAccountResponse data) =>
    json.encode(data.toJson());

class CreateAccountResponse {
  CreateAccountResponse({
    required this.status,
    required this.id,
  });

  bool status;
  String id;

  factory CreateAccountResponse.fromJson(Map<String, dynamic> json) =>
      CreateAccountResponse(
        status: json["status"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "id": id,
      };
}
