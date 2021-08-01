import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fundamental_submission_1/provider/detail_provider.dart';
import 'package:flutter_fundamental_submission_1/ui/error_page.dart';
import 'package:flutter_fundamental_submission_1/widgets/customized_scaffold.dart';
import 'package:provider/provider.dart';

class RestaurantDetail extends StatefulWidget {
  final String index;

  RestaurantDetail(this.index);

  @override
  State<StatefulWidget> createState() {
    return _RestaurantDetailState();
  }
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  @override
  void initState() {
    _initialState();
    super.initState();
  }

  _initialState() {
    final provider = Provider.of<DetailProvider>(context, listen: false);

    provider.checkConnection().then((result) {
      if (result) {
        provider.getDetailRestaurant(widget.index).then((value) {
          // print(value);
        });
      } else {
        provider.setLoadingState(false);
        provider.setErrorMessage("Koneksi tidak tersedia");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<DetailProvider>(builder: (context, provider, child) {
      return (provider.loadingState)
          ? CustomizedScaffold(
              isLoading: true,
              isUsingAppbar: false,
            )
          : (provider.errorMessage == "" && provider.detailRestaurantResult != null)
              ? CustomizedScaffold(
                  isLoading: false,
                  isUsingAppbar: true,
                  content: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate([
                          Hero(
                            tag: provider.detailRestaurantResult!
                                .restaurantDetail.pictureId
                                .toString(),
                            child: FadeInImage.assetNetwork(
                                placeholder: 'images/loading.gif',
                                image:
                                    "https://restaurant-api.dicoding.dev/images/medium/${provider.detailRestaurantResult!.restaurantDetail.pictureId}",
                                height: 250,
                                fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange[400],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      provider.detailRestaurantResult!.restaurantDetail.rating.toString(),
                                      style:
                                          TextStyle(color: Colors.orange[400]),
                                    )
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 30,
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  child: ListView.builder(
                                    itemCount: provider.detailRestaurantResult!.restaurantDetail.categories.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.blue),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Padding(
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${provider.detailRestaurantResult!.restaurantDetail.categories[index].name}',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                        margin: (index != 0)
                                            ? EdgeInsets.only(left: 6)
                                            : EdgeInsets.zero,
                                      );
                                    },
                                  ),
                                ),
                                Divider(color: Colors.grey),
                                Text(
                                  provider.detailRestaurantResult!.restaurantDetail.name ?? "",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Divider(color: Colors.grey),
                                Text(
                                  provider.detailRestaurantResult!.restaurantDetail.description ?? "",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                SizedBox(height: 12),
                                Divider(color: Colors.grey),
                                Text(
                                  "Location: ",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Divider(color: Colors.grey),
                                SizedBox(height: 10),
                                Text(
                                  "City: ${provider.detailRestaurantResult!.restaurantDetail.city}",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                Text(
                                  "Address: ${provider.detailRestaurantResult!.restaurantDetail.address}",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                SizedBox(height: 12),
                                Divider(color: Colors.grey),
                                Text(
                                  "Menus: ",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Divider(color: Colors.grey),
                                Text(
                                  "Foods",
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 30,
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  child: ListView.builder(
                                    itemCount: provider.detailRestaurantResult!.restaurantDetail.menu.foods.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.blue),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Padding(
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${provider.detailRestaurantResult!.restaurantDetail.menu.foods[index].name}',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                        margin: (index != 0)
                                            ? EdgeInsets.only(left: 6)
                                            : EdgeInsets.zero,
                                      );
                                    },
                                  ),
                                ),
                                Text(
                                  "Drinks",
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 30,
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  child: ListView.builder(
                                    itemCount: provider.detailRestaurantResult!.restaurantDetail.menu.drinks.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.blue),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Padding(
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${provider.detailRestaurantResult!.restaurantDetail.menu.drinks[index].name}',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                        margin: (index != 0)
                                            ? EdgeInsets.only(left: 6)
                                            : EdgeInsets.zero,
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 12),
                                Divider(color: Colors.grey),
                                Text(
                                  "Customer Review: ",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Divider(color: Colors.grey),
                                Container(
                                  width: double.infinity,
                                  height: 100,
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  child: ListView.builder(
                                    itemCount: provider.detailRestaurantResult!.restaurantDetail.customerReviews.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        child: Card(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                    child: Text(
                                                        "${provider.detailRestaurantResult!.restaurantDetail.customerReviews[index].name}")),
                                                Flexible(
                                                    child: Text(
                                                  "${provider.detailRestaurantResult!.restaurantDetail.customerReviews[index].date}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption,
                                                )),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Flexible(
                                                    child: Text(
                                                        "${provider.detailRestaurantResult!.restaurantDetail.customerReviews[index].review}")),
                                              ],
                                            ),
                                          ),
                                        ),
                                        margin: (index != 0)
                                            ? EdgeInsets.only(left: 6)
                                            : EdgeInsets.zero,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ))
              : ErrorPage(
                  errorMessage: provider.errorMessage,
                  reloadCallback: () {
                    _initialState();
                  },
                  backCallback: () {
                    Navigator.pop(context);
                  });
    }));
  }
}
