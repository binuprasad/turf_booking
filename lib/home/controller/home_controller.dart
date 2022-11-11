import 'package:get/get.dart';
import 'package:movie_tickets/location_controller/location_controller.dart';
import 'package:movie_tickets/model/home_model.dart';
import 'package:movie_tickets/service/home_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final locationController = Get.put(LocationController());
  var isLoading = true.obs;
  @override
  void onInit() async {
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
    SharedPreferences prf = await SharedPreferences.getInstance();
    final token = prf.getString('token');
    const location = "Malappuram";

    final HomeResponse? response =
        await HomeServices().nearestTurf(location: location, token: token!);
    if (response != null || response!.status == true) {
      nearby.clear();
      nearby.addAll(response.data!);
    }
    isLoading(false);
    update();
  }

  Future allTheTurfs() async {
    SharedPreferences prf = await SharedPreferences.getInstance();
    final token = prf.getString('token');
    final HomeResponse? response = await HomeServices().allTurfs(token: token!);
    if (response != null || response!.status == true) {
      allTurfList.clear();
      allTurfList.addAll(response.data!);
    }
    update();
  }
}
