import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:movie_tickets/constant/list_url.dart';
import 'package:movie_tickets/model/create_account_model.dart';
import 'package:movie_tickets/model/login_account_model.dart';
import '../home/view/home_screen.dart';
import '../model/create_account_verify.dart';

class ApiServices {
  final Dio dio = Dio(BaseOptions(baseUrl: Endpoints.baseurl));

  Future<EmailCreateAccountResponse?> createNewAccountService(
    String email,
    String password,
  ) async {
    Map<String, dynamic> data = {"user_mail": email, "user_password": password};
    try {
      final response = await dio.post(Endpoints.signupEmail, data: data);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return EmailCreateAccountResponse.fromjsom(response.data);
      }
    } catch (e) {
      return EmailCreateAccountResponse(error: true, messege: e.toString());
    }
    return null;
  }

//--------------------------------------------OTP-----------------------------------//

  Future<EmailOTPResponse?> otpverificationService(
      String otp, String id) async {
    log('REcieve ID $id');

    Map<String, String> data = {"user_otp": otp, "_id": id};
    log('REcieve ID $data');

    try {
      Response response = await dio.post(Endpoints.emailOtpVerify, data: data);

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return EmailOTPResponse.fromJson(response.data);
      }
    } catch (e) {
      return EmailOTPResponse(error: true, message: e.toString());
    }
    return null;
  }

//-----------------sign in --------------------//

  Future<EmailLoginRespones?> loginpageService(
      String email, String password) async {
    Map<String, dynamic> data = {"user_mail": email, "user_password": password};
        log(data.toString());

    try {
      Response response = await dio.post(Endpoints.loginEmail, data: data);

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
                       Get.offAll(()=>HomeScreen());
        
        return EmailLoginRespones.fromJson(response.data);
      }
    } catch (e) {
      log("enter catch");
      return EmailLoginRespones(error: true, message: e.toString());
    }
    return null;
  }
}
