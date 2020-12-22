import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/shared_value.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_search.dart';

class RestaurantSearchServices {
  static Future<List<Restaurantss>> ambilSearchResto(String parameter) async {
    String url = baseURL + 'search?q=' + parameter;
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List result = data['restaurants'];

      return result.map((e) => Restaurantss.fromJson(e)).toList();
    } else {
      throw Exception('Ambil Data Gagal');
    }
  }
}