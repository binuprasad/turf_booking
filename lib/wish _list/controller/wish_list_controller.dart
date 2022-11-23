import 'dart:developer';
import 'package:get/get.dart';
import 'package:movie_tickets/home/controller/home_controller.dart';
import 'package:movie_tickets/model/home_model.dart';
import '../../service/wish_list_services.dart';

class WishListController extends GetxController {
  // List<Datum> favTurf = [];
  final homescreencontroller = Get.put(HomeController());

  List<Datum> favaTurf = [];

  Future<void> addFavToDb(Datum data) async {
    // final SharedPreferences pref = await SharedPreferences.getInstance();
    // final id = pref.getString('user_id');
    // log('$id -----------id from addFavToDb function');
    final HomeResponse favResponse = HomeResponse(
      userId: data.id,
      data: [
        Datum(
          id: data.id,
          turfName: data.turfName,
          turfPlace: data.turfPlace,
          turfMunicipality: data.turfMunicipality,
          turfDistrict: data.turfDistrict,
          turfLogo: data.turfLogo,
          v: data.v,
          turfCategory: TurfCategory(
              turfBadminton: data.turfCategory!.turfBadminton,
              turfYoga: data.turfCategory!.turfYoga,
              turfFootball: data.turfCategory!.turfFootball,
              turfCricket: data.turfCategory!.turfCricket),
          turfType: TurfType(
              turfFives: data.turfType!.turfFives,
              turfSevens: data.turfType!.turfSevens),
          turfAmenities: TurfAmenities(
            turfCafeteria: data.turfAmenities!.turfCafeteria,
            turfDressing: data.turfAmenities!.turfDressing,
            turfWashroom: data.turfAmenities!.turfWashroom,
            turfWater: data.turfAmenities!.turfWater,
            turfGallery: data.turfAmenities!.turfGallery,
            turfParking: data.turfAmenities!.turfParking,
          ),
          turfImages: TurfImages(
            turfImages1: data.turfImages!.turfImages1,
            turfImages2: data.turfImages!.turfImages2,
            turfImages3: data.turfImages!.turfImages3,
          ),
          turfInfo: TurfInfo(
              turfIsAvailable: data.turfInfo!.turfIsAvailable,
              turfMap: data.turfInfo!.turfMap,
              turfRating: data.turfInfo!.turfRating),
          turfPrice: TurfPrice(
            afternoonPrice: data.turfPrice!.afternoonPrice,
            eveningPrice: data.turfPrice!.eveningPrice,
            morningPrice: data.turfPrice!.morningPrice,
          ),
          turfTime: TurfTime(
              timeAfternoonEnd: data.turfTime!.timeAfternoonEnd,
              timeAfternoonStart: data.turfTime!.timeAfternoonStart,
              timeEveningEnd: data.turfTime!.timeEveningEnd,
              timeEveningStart: data.turfTime!.timeEveningStart,
              timeMorningEnd: data.turfTime!.timeMorningEnd,
              timeMorningStart: data.turfTime!.timeMorningStart),
        ),
      ],
    );

    await FavServices().addToWishList(favResponse);
  }

//---------------------------------------------------------------------- remove from wishlist function

  Future<void> removeFromFav(String turfId) async {
    await FavServices().deleteWishlist(turfId);
  }

//-------------------------------------------------------------------------Get favourite list

  Future<void> getFav(Datum data) async {
    final favresponse = await FavServices().getFav(data.id!);
    log('${data.id}  -------id in getfav function');
    favaTurf.clear();
    if (favresponse != null) {
      favaTurf.addAll(favresponse.data!);
      log(favresponse.data.toString());
      log("fav turf list:------- $favaTurf");
    } else {
      log('favresponse is null');
    }
  }

//-------------------------------------------------------------------------------------checking whether the turf is already added to favourite or not

  RxBool isFav(Datum data) {
    return favaTurf.contains(data).obs;
  }

//-------------------------------------------------------------------------------------favourite button final function

  checkFavAndAddToDb(Datum data) async {
    isFav(data).value == true
        ? await removeFromFav(data.id!)
        : await addFavToDb(data);
    log("isfav.value ${isFav(data).value}");
    await getFav(data);
    log('${favaTurf[3]}  ----------favaturf list');

    log('inside checkandaddtodb after calling getfav favturflist length is :${favaTurf.length}');
  }

  // @override
  // void onInit() {
  //   getFav();
  //   log(getFav().toString());
  //   super.onInit();
  // }
}
