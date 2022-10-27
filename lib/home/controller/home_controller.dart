import 'dart:developer';
import 'package:get/get.dart';
import 'package:movie_tickets/location_controller/location_controller.dart';
import 'package:movie_tickets/model/home_model.dart';
import 'package:movie_tickets/service/home_service.dart';

class HomeController extends GetxController {
  final locationController = Get.put(LocationController());
 var isLoading = true.obs;
  @override
  void onInit()async{
await nearestTurf();
await allTheTurfs();
    super.onInit();
  }
  var currentIndex = 0.0.obs;
  List<Datum> nearby = [];
List<Datum> allTurfList = [];
  

  imageInadex(double index) {
    currentIndex.value = index;
    update();
  }

  Future nearestTurf() async {
    isLoading(true);
    // SharedPreferences pref = await SharedPreferences.getInstance();
    String token =  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzNTEzMTMxNjIyYWU2OTg0ZWQ2NzhhNyIsImlhdCI6MTY2Njc4NDc4OSwiZXhwIjoxNjY2ODcxMTg5fQ.LcXlo93bflXbNgiKiwEifM9-gYh3g1QXf9Ywl8o5kvw";
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
    isLoading(false);
  }

  Future allTheTurfs()async{
    String token ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzNTEzMTMxNjIyYWU2OTg0ZWQ2NzhhNyIsImlhdCI6MTY2Njc4NDc4OSwiZXhwIjoxNjY2ODcxMTg5fQ.LcXlo93bflXbNgiKiwEifM9-gYh3g1QXf9Ywl8o5kvw";
    final HomeResponse? response = await HomeServices().allTurfs(token: token);
    log('entered');
    if(response !=null || response!.status == true){
      log('entere into condition');
      allTurfList.clear();
      log('before legth${allTurfList.length}');
      allTurfList.addAll(response.data!);
      log('legth of allturf${allTurfList.length}');
      

    }
  }
  

 
  
}
