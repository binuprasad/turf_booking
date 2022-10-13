import 'dart:convert';

VerifyAccountRequest verifyAccountRequestFromJson(String str) => VerifyAccountRequest.fromJson(json.decode(str));

String verifyAccountRequestToJson(VerifyAccountRequest data) => json.encode(data.toJson());

class VerifyAccountRequest {
    VerifyAccountRequest({
        required this.userOtp,
        required this.id,
    });

    String userOtp;
    String id;

    factory VerifyAccountRequest.fromJson(Map<String, dynamic> json) => VerifyAccountRequest(
        userOtp: json["user_otp"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "user_otp": userOtp,
        "_id": id,
    };
}
