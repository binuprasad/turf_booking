import 'dart:convert';

// CreateAccountRequest createAccountRequestFromJson(String str) => CreateAccountRequest.fromJson(json.decode(str));

String createAccountRequestToJson(CreateAccountRequest data) => json.encode(data.toJson());

class CreateAccountRequest {
    CreateAccountRequest({
        required this.userMail,
        required this.userPassword,
    });

    String userMail;
    String userPassword;

    // factory CreateAccountRequest.fromJson(Map<String, dynamic> json) => CreateAccountRequest(
    //     userMail: json["user_mail"],
    //     userPassword: json["user_password"],
    // );

    Map<String, dynamic> toJson() => {
        "user_mail": userMail,
        "user_password": userPassword,
    };
}

