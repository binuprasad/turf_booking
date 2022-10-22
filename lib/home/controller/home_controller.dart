import 'dart:developer';
import 'package:get/get.dart';
import 'package:movie_tickets/location_controller/location_controller.dart';
import 'package:movie_tickets/model/home_model.dart';
import 'package:movie_tickets/service/home_service.dart';

class HomeController extends GetxController {
  final locationController = Get.put(LocationController());

  @override
  void onInit()async{
await nearestTurf();
    super.onInit();
  }
  var currentIndex = 0.0.obs;
  RxList nearby = [].obs;
  

  imageInadex(double index) {
    currentIndex.value = index;
    update();
  }

  Future nearestTurf() async {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzNTEzMTMxNjIyYWU2OTg0ZWQ2NzhhNyIsImlhdCI6MTY2NjMyODM1NywiZXhwIjoxNjY2NDE0NzU3fQ.o93r4BmmJgPOhL2tGs3fqS6_N3c5g4isbmBoND600yU";
    const location = "Malappuram";
    
    final HomeResponse? response =
        await HomeServices().nearestTurf(location: location, token: token);
    log('message');
    //  log('before res${response!.data.toString()}');
    log('before add $nearby'.toString());
    if (response != null || response!.status == true) {
      log('after add222 $nearby'.toString());
      nearby.clear();
      nearby.addAll(response.data!);
      log('after add $nearby'.toString());
    }
  }

 
  
}
