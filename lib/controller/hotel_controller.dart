import 'package:get/get.dart';
import 'package:test_app/services/hotel_services.dart';

import '../model/hotel_model.dart';

class HotelController extends GetxController {
  var isLoading = false.obs;
  var hotelList = <Result>[].obs;
  @override
  void onInit() {
    getUserList();
    super.onInit();
  }

  getUserList() async {
    try {
      var hotel = await HotelServices.hotelList();
      if (hotel != null) {
        hotelList.value = hotel.result!;
      }
      update();
    } finally {
      isLoading(false);
      update();
    }
  }
}
