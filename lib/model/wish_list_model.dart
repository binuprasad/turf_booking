import 'dart:convert';

WishListResponse homeResponseFromJson(String str) =>
    WishListResponse.fromJson(json.decode(str));

class WishListResponse {
  WishListResponse({
    this.status,
    this.data,
    this.userId,
  });
  String? userId;
  bool? status;
  List<Datum>? data;

  factory WishListResponse.fromJson(Map<String, dynamic> json) => WishListResponse(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        userId: json["userId"]
      );

      Map<String,dynamic>toJson()=> {
      "status": status,
      "data" : data,
      "userId" :userId

      };
}

class Datum {
  Datum({
    this.turfCategory,
    this.turfType,
    this.turfInfo,
    this.turfAmenities,
    this.turfImages,
    this.turfTime,
    this.id,
    this.turfCreatorId,
    this.turfName,
    this.turfPlace,
    this.turfMunicipality,
    this.turfDistrict,
    this.turfPrice,
    this.turfLogo,
    this.v,
  });

  TurfCategory? turfCategory;
  TurfType? turfType;
  TurfInfo? turfInfo;
  TurfAmenities? turfAmenities;
  TurfImages? turfImages;
  TurfTime? turfTime;
  String? id;
  String? turfCreatorId;
  String? turfName;
  String? turfPlace;
  String? turfMunicipality;
  String? turfDistrict;
  TurfPrice? turfPrice;
  String? turfLogo;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        turfCategory: TurfCategory.fromJson(json["turf_category"]),
        turfType: TurfType.fromJson(json["turf_type"]),
        turfInfo: TurfInfo.fromJson(json["turf_info"]),
        turfAmenities: TurfAmenities.fromJson(json["turf_amenities"]),
        turfImages: TurfImages.fromJson(json["turf_images"]),
        turfTime: TurfTime.fromJson(json["turf_time"]),
        id: json["_id"],
        turfCreatorId: json["turf_creator_id"],
        turfName: json["turf_name"],
        turfPlace: json["turf_place"],
        turfMunicipality: json["turf_municipality"],
        turfDistrict: json["turf_district"],
        turfPrice: TurfPrice.fromJson(json["turf_price"]),
        turfLogo: json["turf_logo"],
        v: json["__v"],
      );

}
 
//  Map<String,dynamic> toJson() {
//   final Map<String,dynamic> data = <String ,dynamic>{};
//  data["turf_category"]  = TurfCategory;
//   data["turf_type"]= TurfType;
//   data["turf_info"] = TurfInfo;
//   data["turf_amenities"] = TurfAmenities;
//   data["turf_images"] = TurfImages;
//   data["turf_time"] = TurfTime;
//   data["_id"] = id;
//   data["turf_creator_id"] = turfcreat;
//   data["turf_name"] = Turfname;
//   data["turf_place"] = turfplace;
//   data["turf_municipality"] = turfMunicipality;
//   data["turf_district"] = turfDistrict;
//   data["turf_price"] = TurfPrice;
//   data["turf_logo"] =  turfLogo;
//   data["__v"] = v ;

//   return data;



//  }

class TurfAmenities {
  TurfAmenities({
    this.turfWashroom,
    this.turfWater,
    this.turfDressing,
    this.turfParking,
    this.turfGallery,
    this.turfCafeteria,
  });

  bool? turfWashroom;
  bool? turfWater;
  bool? turfDressing;
  bool? turfParking;
  bool? turfGallery;
  bool? turfCafeteria;

  factory TurfAmenities.fromJson(Map<String, dynamic> json) => TurfAmenities(
        turfWashroom: json["turf_washroom"],
        turfWater: json["turf_water"],
        turfDressing: json["turf_dressing"],
        turfParking: json["turf_parking"],
        turfGallery: json["turf_gallery"],
        turfCafeteria: json["turf_cafeteria"],
      );
}

class TurfCategory {
  TurfCategory({
    this.turfCricket,
    this.turfFootball,
    this.turfBadminton,
    this.turfYoga,
  });

  bool? turfCricket;
  bool? turfFootball;
  bool? turfBadminton;
  bool? turfYoga;

  factory TurfCategory.fromJson(Map<String, dynamic> json) => TurfCategory(
        turfCricket: json["turf_cricket"],
        turfFootball: json["turf_football"],
        turfBadminton: json["turf_badminton"],
        turfYoga: json["turf_yoga"],
      );
}

class TurfImages {
  TurfImages({
    this.turfImages1,
    this.turfImages2,
    this.turfImages3,
  });

  String? turfImages1;
  String? turfImages2;
  String? turfImages3;

  factory TurfImages.fromJson(Map<String, dynamic> json) => TurfImages(
        turfImages1: json["turf_images1"],
        turfImages2: json["turf_images2"],
        turfImages3: json["turf_images3"],
      );
}

class TurfInfo {
  TurfInfo({
    this.turfIsAvailable,
    this.turfRating,
    this.turfMap,
  });

  bool? turfIsAvailable;
  double? turfRating;
  String? turfMap;

  factory TurfInfo.fromJson(Map<String, dynamic> json) => TurfInfo(
        turfIsAvailable: json["turf_isAvailable"],
        turfRating: json["turf_rating"].toDouble(),
        turfMap: json["turf_map"],
      );
}

class TurfPrice {
  TurfPrice({
    this.morningPrice,
    this.afternoonPrice,
    this.eveningPrice,
  });

  int? morningPrice;
  int? afternoonPrice;
  int? eveningPrice;

  factory TurfPrice.fromJson(Map<String, dynamic> json) => TurfPrice(
        morningPrice: json["morning_price"],
        afternoonPrice: json["afternoon_price"],
        eveningPrice: json["evening_price"],
      );
}

class TurfTime {
  TurfTime({
    this.timeMorningStart,
    this.timeMorningEnd,
    this.timeAfternoonStart,
    this.timeAfternoonEnd,
    this.timeEveningStart,
    this.timeEveningEnd,
  });

  int? timeMorningStart;
  int? timeMorningEnd;
  int? timeAfternoonStart;
  int? timeAfternoonEnd;
  int? timeEveningStart;
  int? timeEveningEnd;

  factory TurfTime.fromJson(Map<String, dynamic> json) => TurfTime(
        timeMorningStart: json["time_morning_start"],
        timeMorningEnd: json["time_morning_end"],
        timeAfternoonStart: json["time_afternoon_start"],
        timeAfternoonEnd: json["time_afternoon_end"],
        timeEveningStart: json["time_evening_start"],
        timeEveningEnd: json["time_evening_end"],
      );
}

class TurfType {
  TurfType({
    this.turfSevens,
    this.turfFives,
  });

  bool? turfSevens;
  bool? turfFives;

  factory TurfType.fromJson(Map<String, dynamic> json) => TurfType(
        turfSevens: json["turf_sevens"],
        turfFives: json["turf_sixes"],
      );
}


// import 'dart:convert';

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

// class Welcome {
//     Welcome({
//         this.status,
//         this.message,
//         this.token,
//         this.refreshToken,
//         this.id,
//     });

//     bool status;
//     String message;
//     String token;
//     String refreshToken;
//     String id;

//     factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         status: json["status"],
//         message: json["message"],
//         token: json["token"],
//         refreshToken: json["refreshToken"],
//         id: json["_id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "token": token,
//         "refreshToken": refreshToken,
//         "_id": id,
//     };
// }
