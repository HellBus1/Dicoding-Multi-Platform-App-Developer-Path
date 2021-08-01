import 'package:flutter_fundamental_submission_1/data/models/restaurant.dart';

class DetailRestaurantResult {
  bool error = false;
  String message = "";
  RestaurantDetail restaurantDetail;

  DetailRestaurantResult(
      {required this.error,
      required this.message,
      required this.restaurantDetail});

  factory DetailRestaurantResult.fromJson(Map<String, dynamic> json) =>
      (DetailRestaurantResult(
          error: json['error'],
          message: json['message'],
          restaurantDetail: RestaurantDetail.fromJson(json['restaurant'])));
}

class RestaurantDetail extends Restaurant {
  List<Category> categories;
  Menus menu;
  String address;
  List<CustomerReview> customerReviews;

  RestaurantDetail(
      {required id,
      required name,
      required description,
      required pictureId,
      required city,
      required rating,
      required this.categories,
      required this.menu,
      required this.address,
      required this.customerReviews})
      : super(
            id: id,
            name: name,
            description: description,
            pictureId: pictureId,
            city: city,
            rating: rating);

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) =>
      (RestaurantDetail(
          id: json["id"],
          name: json["name"],
          description: json["description"],
          pictureId: json["pictureId"],
          city: json["city"],
          rating: json["rating"].toString(),
          categories: List<Category>.from((json["categories"] as List)
              .map((item) => Category.fromJson(item))
              .where((category) => (category.name != null))),
          menu: Menus.fromJson(json["menus"]),
          address: json["address"],
          customerReviews: List<CustomerReview>.from(
            (json["customerReviews"] as List)
                .map((item) => CustomerReview.fromJson(item))
                .where((customerReview) => (customerReview.name != null &&
                    customerReview.review != null &&
                    customerReview.date != null)),
          )));
}

class Menus {
  List<Menu> foods = [];
  List<Menu> drinks = [];

  Menus({required this.foods, required this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) => (Menus(
      foods: List<Menu>.from((json["foods"] as List)
          .map((item) => Menu.fromJson(item))
          .where((menu) => (menu.name != null))),
      drinks: List<Menu>.from((json["drinks"] as List)
          .map((item) => Menu.fromJson(item))
          .where((menu) => (menu.name != null)))));
}

class Menu {
  String? name;

  Menu({required this.name});

  factory Menu.fromJson(Map<String, dynamic> json) =>
      (Menu(name: json['name']));
}

class Category {
  String? name;

  Category({required this.name});

  factory Category.fromJson(Map<String, dynamic> json) =>
      (Category(name: json['name']));
}

class CustomerReview {
  String? name;
  String? review;
  String? date;

  CustomerReview(
      {required this.name, required this.review, required this.date});

  factory CustomerReview.fromJson(Map<String, dynamic> json) => (CustomerReview(
      name: json["name"], review: json["review"], date: json["date"]));
}
