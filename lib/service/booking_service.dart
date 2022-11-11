import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_tickets/constant/list_url.dart';
import 'package:movie_tickets/login/error_handling/error_handling.dart';
import 'package:movie_tickets/model/booking_model.dart';

class BookingService {
  final Dio dio = Dio(BaseOptions(baseUrl: Endpoints.baseurl));

  Future<Bookingresponse?> getBooking({required String id}) async {
    try {
      final Response response = await dio.get(Endpoints.getBooking + id);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        return Bookingresponse.fromJson(response.data);
      }
    } catch (e) {
      ErrorHandling().errorHandler(e);
    }
    return null;
  }

//------------------------ Add booking ------------------------//

  Future<Bookingresponse?> addBooking({
    required String date,
    required String id,
    required List slot,
  }) async {
    try {
      final Response response =
          await dio.post(Endpoints.bookingAdd + id + date);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return Bookingresponse.fromJson(response.data);
      }
    } catch (e) {
      ErrorHandling().errorHandler(e);
    }
    return null;
  }
}
