import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_tickets/constant/list_url.dart';
import 'package:movie_tickets/login/error_handling/error_handling.dart';
import 'package:movie_tickets/model/booking_model.dart';

import '../model/add_booking_model.dart';

class BookingService {
  final Dio dio = Dio(BaseOptions(baseUrl: Endpoints.baseurl));

  Future<BookResponse?> getBooking({required String id}) async {
    try {
      final Response response = await dio.get(Endpoints.getBooking + id);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log("response ${response.data}");
        return BookResponse.fromJson(response.data);
      }
    } catch (e) {
      ErrorHandling().errorHandler(e);
    }
    return null;
  }

//------------------------ Add booking ------------------------//

  Future<bool?> addBooking({required AddBookingRequest model}) async {
    try {
      final Response response =
          await dio.post(Endpoints.bookingAdd, data: model.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return true;
      }
    } catch (e) {
      ErrorHandling().errorHandler(e);
    }
    return null;
  }
}
