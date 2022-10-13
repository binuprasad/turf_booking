import 'package:dio/dio.dart';
import 'package:movie_tickets/constant/list_url.dart';
import 'package:movie_tickets/model/create_account_model/create_account_request.dart';
import 'package:movie_tickets/model/create_account_model/create_account_response.dart';

class ApiServices{
  static final dio =Dio(BaseOptions(baseUrl: Endpoints.baseurl));

  static Future<CreateAccountResponse?>createAccountService(CreateAccountRequest model)async{
    final Response response =await dio.post(Endpoints.signupEmail,data: model.toJson());
    if(response.statusCode! >=200 && response.statusCode! <=299){
      return CreateAccountResponse.fromJson(response.data);
    }
    return null;

  }
  
 
}