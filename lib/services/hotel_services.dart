import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/hotel_model.dart';

class HotelServices {
  static var client = http.Client();
  static Future<HotelModel?> hotelList() async {
    var response = await client
        .get(Uri.parse('https://foodbukka.herokuapp.com/api/v1/restaurant'));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var hotelList = HotelModel.fromJson(jsonResponse);

      return hotelList;
    } else {
      return null;
    }
  }
}
