import 'dart:convert';

import 'package:submission2_flutter_fundamental_dicoding_bloc/common/shared_value.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_detail.dart';
import 'package:http/http.dart' as http;

class RestaurantDetailServices {
  static Future<Restaurant> ambilDetailResto(String id) async {
    String url = baseURL + 'detail/' + id;
    var response = await http.get(url);
print(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var result = data['restaurant'];

      return Restaurant.fromJson(result);
    } else {
      throw Exception('Ambil Data Gagal');
    }
  }
}