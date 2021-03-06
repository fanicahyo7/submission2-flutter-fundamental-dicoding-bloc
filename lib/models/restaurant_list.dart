import 'package:equatable/equatable.dart';

class RestaurantList extends Equatable {
  RestaurantList({
    this.error,
    this.message,
    this.count,
    this.restaurants,
  });

  final bool error;
  final String message;
  final int count;
  final List<Restaurants> restaurants;

  factory RestaurantList.fromJson(Map<String, dynamic> json) => RestaurantList(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: List<Restaurants>.from(
            json["restaurants"].map((x) => Restaurants.fromJson(x))),
      );

  factory RestaurantList.fromJsonNo() =>
      RestaurantList(
        error: true,
        message: "Tidak Ada Internet\nPeriksalah Koneksi Anda!",
        count: 0,
        restaurants: [],
      );

  @override
  List<Object> get props => [restaurants, message, error];
}

class Restaurants extends Equatable {
  Restaurants({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
      );

  @override
  List<Object> get props => [
        id,
        name,
        description,
        pictureId,
        city,
        rating,
      ];
}
