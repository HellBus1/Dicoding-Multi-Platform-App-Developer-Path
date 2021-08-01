import 'package:connectivity/connectivity.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fundamental_submission_1/data/models/restaurant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainProvider extends ChangeNotifier {
  RestaurantResult? restaurantResult = new RestaurantResult(
      error: false, message: "", count: 0, restaurants: []);
  RestaurantSearchResult? restaurantSearchResult =
      new RestaurantSearchResult(error: false, founded: 0, restaurants: []);
  static const BASE_URL = "https://restaurant-api.dicoding.dev/";

  var loadingState = true;
  var searchLoadingState = false;
  bool isConnected = false;
  String errorMessage = "";

  Future<bool> getRestaurant() async {
    try {
      var response = await http.get(Uri.parse(BASE_URL + "list"));
      if (response.statusCode == 200) {
        restaurantResult =
            RestaurantResult.fromJson(json.decode(response.body));
        setErrorMessage("");
        setLoadingState(false);
        return true;
      } else {
        setLoadingState(false);
        setErrorMessage("Terjadi kesalahan silahkan refresh");
        return false;
      }
    } catch (e) {
      print(e);
      setErrorMessage("Terjadi kesalahan silahkan refresh");
      setLoadingState(false);
      return false;
    }
  }

  Future<bool> getRestaurantByQuery(query) async {
    setSearchLoadingState(true);
    try {
      var response = await http.get(Uri.parse(BASE_URL + "search?q=$query"));
      if (response.statusCode == 200) {
        restaurantSearchResult =
            RestaurantSearchResult.fromJson(json.decode(response.body));
        setErrorMessage("");
        setSearchLoadingState(false);
        return true;
      } else {
        setErrorMessage("Terjadi kesalahan silahkan refresh");
        setSearchLoadingState(false);
        return false;
      }
    } catch (e) {
      print(e);
      setErrorMessage("Terjadi kesalahan silahkan refresh");
      setSearchLoadingState(false);
      return false;
    }
  }

  Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      this.isConnected = true;
      notifyListeners();
      return true;
    }
    this.isConnected = false;
    notifyListeners();
    return false;
  }

  setLoadingState(value) {
    this.loadingState = value;
    notifyListeners();
  }

  setSearchLoadingState(value) {
    this.searchLoadingState = value;
    notifyListeners();
  }

  setErrorMessage(value) {
    this.errorMessage = value;
    notifyListeners();
  }
}
