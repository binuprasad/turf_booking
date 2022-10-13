import 'dart:convert';

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
    LoginRequest({
        required this.userMail,
        required this.userPassword,
    });

    String userMail;
    String userPassword;

    factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        userMail: json["user_mail"],
        userPassword: json["user_password"],
    );

    Map<String, dynamic> toJson() => {
        "user_mail": userMail,
        "user_password": userPassword,
    };
}
