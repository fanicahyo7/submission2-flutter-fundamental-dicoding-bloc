import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/shared_value.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_detail.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_list.dart';

class RestaurantListServices {
  static Future<List<Restaurants>> ambilRestoList() async {
    String url = baseURL + 'list';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List result = data['restaurants'];

      return result.map((e) => Restaurants.fromJson(e)).toList();
    } else {
      throw Exception('Ambil Data Gagal');
    }
  }

  static Future<List<Restaurant>> ambilDetailResto(String id) async {
    String url = baseURL + 'detail/' + id;
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List result = data['restaurant'];

      return result.map((e) => Restaurant.fromJson(e)).toList();
    } else {
      throw Exception('Ambil Data Gagal');
    }
  }
}
