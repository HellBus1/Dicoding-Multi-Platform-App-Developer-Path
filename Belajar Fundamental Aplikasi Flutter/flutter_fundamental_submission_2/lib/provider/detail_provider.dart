import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_fundamental_submission_1/data/models/detail_restaurant.dart';

class DetailProvider extends ChangeNotifier {
  DetailRestaurantResult? detailRestaurantResult;
  static const BASE_URL = "https://restaurant-api.dicoding.dev/";

  var loadingState = true;
  bool isConnected = false;

  String errorMessage = "";

  Future<bool> getDetailRestaurant(id) async {
    try {
      var response = await http.get(Uri.parse(BASE_URL + "detail/$id"));
      if (response.statusCode == 200) {
        detailRestaurantResult =
            DetailRestaurantResult.fromJson(json.decode(response.body));
        // print(response.body);
        setErrorMessage("");
        setLoadingState(false);
        return true;
      } else {
        setErrorMessage("Terjadi kesalahan silahkan refresh");
        setLoadingState(false);
        return false;
      }
    } catch (e) {
      print(e);
      setErrorMessage("Terjadi kesalahan silahkan refresh");
      setLoadingState(false);
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

  setErrorMessage(value) {
    this.errorMessage = value;
    notifyListeners();
  }
}
