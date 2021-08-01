import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fundamental_submission_1/utils/dummy_restaurant.dart';

import 'models/restaurant.dart';

class RestaurantDetail extends StatefulWidget {
  final int index;

  RestaurantDetail(this.index);

  @override
  State<StatefulWidget> createState() {
    return _RestaurantDetailState();
  }
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  late Restaurant _restaurantDetail;

  @override
  void initState() {
    _restaurantDetail = DummyRestaurant.generateRestaurantDummy()[widget.index];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              child: FadeInImage.assetNetwork(
                  placeholder: 'images/loading.gif',
                  image: _restaurantDetail.imagePath,
                  height: 250,
                  fit: BoxFit.cover),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Text(_restaurantDetail.name,
                  style: Theme.of(context).textTheme.headline5),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.location_searching),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: Text(_restaurantDetail.location,
                          style: Theme.of(context).textTheme.subtitle2)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
              child: Flexible(
                  child: Text("Deskripsi",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20))),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Flexible(
                  child: Text(_restaurantDetail.description,
                      style: Theme.of(context).textTheme.bodyText1)),
            )
          ])),
        ],
      ),
    ));
  }
}
