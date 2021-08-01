class RestaurantResult {
  bool error = false;
  String message = "";
  int count = 0;
  List<Restaurant> restaurants = [];

  RestaurantResult(
      {required this.error,
      required this.message,
      required this.count,
      required this.restaurants});

  factory RestaurantResult.fromJson(Map<String, dynamic> json) =>
      RestaurantResult(
          error: json["error"],
          message: json["message"],
          count: json["count"],
          restaurants: List<Restaurant>.from((json["restaurants"] as List)
              .map((item) => Restaurant.fromJson(item))
              .where((restaurant) =>
                  restaurant.id != null &&
                  restaurant.name != null &&
                  restaurant.description != null &&
                  restaurant.pictureId != null &&
                  restaurant.city != null &&
                  restaurant.rating != null)));
}

class RestaurantSearchResult {
  bool error = false;
  int founded = 0;
  List<Restaurant> restaurants = [];

  RestaurantSearchResult(
      {required this.error, required this.founded, required this.restaurants});

  factory RestaurantSearchResult.fromJson(Map<String, dynamic> json) =>
      RestaurantSearchResult(
          error: json["error"],
          founded: json["founded"],
          restaurants: List<Restaurant>.from((json["restaurants"] as List)
              .map((item) => Restaurant.fromJson(item))
              .where((restaurant) =>
                  restaurant.id != null &&
                  restaurant.name != null &&
                  restaurant.description != null &&
                  restaurant.pictureId != null &&
                  restaurant.city != null &&
                  restaurant.rating != null)));
}

class Restaurant {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  String? rating;

  Restaurant(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating});

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      pictureId: json["pictureId"],
      city: json["city"],
      rating: json["rating"].toString());
}
