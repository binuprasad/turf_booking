import 'dart:developer';

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
    log(token.toString());
    log(location);
    log(Endpoints.baseurl + Endpoints.nearestTurf + location);
    log('old token ----------eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzNTEzMTMxNjIyYWU2OTg0ZWQ2NzhhNyIsImlhdCI6MTY2NjI3NjE1NiwiZXhwIjoxNjY2Mjg2OTU2fQ.5hWD1emNXRDNcKzyQCWFJFNg6ApwM5TicwYDwZoTQ2E------------');
    try {
      final Response response = await dio.get(Endpoints.nearestTurf + location,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      log('before home service response statuscode ');

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('after home service response statuscode');

        return HomeResponse.fromJson(response.data);
      }
    } catch (e) {
      ErrorHandling().errorHandler(e);
    }
    return null;
  }
}
