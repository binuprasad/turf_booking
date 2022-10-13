import 'dart:convert';

VerifyAccountResponse verifyAccountResponseFromJson(String str) => VerifyAccountResponse.fromJson(json.decode(str));

String verifyAccountResponseToJson(VerifyAccountResponse data) => json.encode(data.toJson());

class VerifyAccountResponse {
    VerifyAccountResponse({
        required this.status,
        required this.message,
        required this.token,
        this.refreshToken,
    });

    bool status;
    String message;
    String token;
    String? refreshToken;

    factory VerifyAccountResponse.fromJson(Map<String, dynamic> json) => VerifyAccountResponse(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        refreshToken: json["refreshToken"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "refreshToken": refreshToken,
    };
}
