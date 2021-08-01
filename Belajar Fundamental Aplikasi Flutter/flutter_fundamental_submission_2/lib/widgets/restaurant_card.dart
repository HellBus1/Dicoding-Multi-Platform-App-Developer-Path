import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fundamental_submission_1/data/models/restaurant.dart';
import 'package:flutter_fundamental_submission_1/ui/restaurant_detail.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
      child: Card(
        elevation: 4,
        child: Material(
          color: Colors.white,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            leading: Hero(
              tag: restaurant.pictureId!,
              child: Image.network(
                "https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId!}",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              restaurant.name ?? "",
            ),
            subtitle: Column(
              children: [
                Text(
                  restaurant.description ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange[200],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      restaurant.rating.toString(),
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                )
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RestaurantDetail(restaurant.id ?? "")));
            },
          ),
        ),
      ),
    );
  }
}
