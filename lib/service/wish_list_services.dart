import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:movie_tickets/constant/list_url.dart';
import 'package:movie_tickets/model/home_model.dart';
import '../auth/error_handling/error_handling.dart';

class FavServices {
  final Dio dio = Dio(BaseOptions(baseUrl: Endpoints.baseurl));

//--------------------------------add to favourite service-------------------------------
  Future<HomeResponse?> addToWishList(HomeResponse favResponse) async {
    try {
      final Response response =
          await dio.post(Endpoints.addWishList, data: favResponse.toJson());

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return HomeResponse.fromJson(response.data);
      }
    } catch (e) {
      log("add to wishlist catch${e.toString()}");
        ErrorHandling().errorHandler(e);

    }
    return null;
  }

//--------------------------------get favourite list service-------------------------------
  Future<HomeResponse?> getFav(String id) async {
    try {
      final Response response = await dio.get(Endpoints.getWishList + id);

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('get fav response ${response.data}');
        return HomeResponse.fromJson(response.data);
      }
    } catch (e) {
     ErrorHandling().errorHandler(e);
    }
    return null;
  }

//--------------------------------get favourite list service-------------------------------
  Future<HomeResponse?> deleteWishlist(String id) async {
    try {
      final Response response = await dio.delete(Endpoints.removeWishList + id);

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return HomeResponse.fromJson(response.data);
      }
    } catch (e) {
           ErrorHandling().errorHandler(e);

    }
    return null;
  }
}