import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fundamental_submission_1/restaurant_detail.dart';
import 'package:flutter_fundamental_submission_1/utils/dummy_restaurant.dart';

class RestaurantList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RestaurantListState();
  }
}

class _RestaurantListState extends State<RestaurantList> {
  List restaurant = [];

  @override
  void initState() {
    restaurant.addAll(DummyRestaurant.generateRestaurantDummy());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Text("Restaurant",
                  style: Theme.of(context).textTheme.headline5),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text("Recoomendation restaurant for you!",
                  style: Theme.of(context).textTheme.subtitle2),
            )
          ])),
          SliverList(
              delegate: SliverChildListDelegate(
            List.generate(restaurant.length, (index) {
              return Container(
                margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RestaurantDetail(index)),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            child: FadeInImage.assetNetwork(
                                placeholder: 'images/loading.gif',
                                image: restaurant[index].imagePath,
                                width: 110,
                                height: 100,
                                fit: BoxFit.cover),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      restaurant[index].name,
                                      textAlign: TextAlign.start,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Icon(Icons.location_searching),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                          child: Text(
                                              restaurant[index].location,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.amber[400],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                          child: Text(restaurant[index]
                                              .rating
                                              .toString()))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ))
        ],
      ),
    ));
  }
}
