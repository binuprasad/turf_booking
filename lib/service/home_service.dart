import 'package:dio/dio.dart';
import 'package:movie_tickets/constant/list_url.dart';
import 'package:movie_tickets/login/error_handling/error_handling.dart';
import 'package:movie_tickets/model/home_model.dart';

class HomeServices {
  final Dio dio = Dio(BaseOptions(baseUrl: Endpoints.baseurl));

  Future<HomeResponse?> nearestTurf({
    required String location,
    required String token,
  }) async {
    try {
      final Response response = await dio.get(
        Endpoints.nearestTurf + location,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return HomeResponse.fromJson(response.data);
      }
    } catch (e) {
      ErrorHandling().errorHandler(e);
    }
    return null;
  }

  Future<HomeResponse?> allTurfs({required String token}) async {
    try {
      final Response response = await dio.get(Endpoints.allTurf,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return HomeResponse.fromJson(response.data);
      }
    } catch (e) {
      ErrorHandling().errorHandler(e); 
    }
    return null;
  }
}
