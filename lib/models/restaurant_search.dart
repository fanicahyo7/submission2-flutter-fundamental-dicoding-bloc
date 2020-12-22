class RestaurantSearch {
  RestaurantSearch({
    this.error,
    this.founded,
    this.restaurants,
  });

  bool error;
  int founded;
  List<Restaurantss> restaurants;

  factory RestaurantSearch.fromJson(Map<String, dynamic> json) =>
      RestaurantSearch(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<Restaurantss>.from(
            json["restaurants"].map((x) => Restaurantss.fromJson(x))),
      );
}

class Restaurantss {
  Restaurantss({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  factory Restaurantss.fromJson(Map<String, dynamic> json) => Restaurantss(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
      );
}
