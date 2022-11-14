import 'dart:convert';

BookResponse bookResponseFromJson(String str) =>
    BookResponse.fromJson(json.decode(str));

class BookResponse {
  BookResponse({
    required this.status,
    required this.data,
  });

  bool status;
  List<BookingDatum> data;

  factory BookResponse.fromJson(Map<String, dynamic> json) => BookResponse(
        status: json["status"],
        data: List<BookingDatum>.from(
            json["data"].map((x) => BookingDatum.fromJson(x))),
      );
}

class BookingDatum {
  BookingDatum({
    required this.id,
    required this.bookingDate,
    required this.turfId,
    required this.timeSlot,
  });

  String id;
  String bookingDate;
  String turfId;
  List<int> timeSlot;

  factory BookingDatum.fromJson(Map<String, dynamic> json) => BookingDatum(
        id: json["_id"],
        bookingDate: json["booking_date"],
        turfId: json["turf_id"],
        timeSlot: List<int>.from(json["time_slot"].map((x) => x)),
      );
}
