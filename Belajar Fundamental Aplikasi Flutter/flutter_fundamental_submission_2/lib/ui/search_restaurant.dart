import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fundamental_submission_1/provider/main_provider.dart';
import 'package:flutter_fundamental_submission_1/ui/error_page.dart';
import 'package:flutter_fundamental_submission_1/widgets/customized_scaffold.dart';
import 'package:flutter_fundamental_submission_1/widgets/restaurant_card.dart';
import 'package:provider/provider.dart';

class SearchRestaurant extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchRestaurantState();
  }
}

class _SearchRestaurantState extends State<SearchRestaurant> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<MainProvider>(builder: (context, provider, child) {
      return (provider.searchLoadingState)
          ? CustomizedScaffold(
              isLoading: true,
              isUsingAppbar: false,
            )
          : (provider.errorMessage == "") ? CustomizedScaffold(
              isLoading: false,
              isUsingAppbar: true,
              content: CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Container(
                      margin: EdgeInsets.only(
                          top: 10, bottom: 10, left: 12, right: 12),
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              child: Flexible(
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText:
                                          'Masukan nama / kategori / menu restoran'),
                                  controller: searchController,
                                ),
                              ),
                            ),
                            Container(
                              child: IconButton(
                                  onPressed: () {
                                    provider.getRestaurantByQuery(
                                        searchController.text);
                                  },
                                  icon: Icon(Icons.search)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ])),
                  SliverList(
                      delegate: SliverChildListDelegate(
                    List.generate(
                        provider.restaurantSearchResult!.restaurants.length,
                        (index) {
                      return RestaurantCard(
                          restaurant: provider
                              .restaurantSearchResult!.restaurants[index]);
                    }),
                  )),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    SizedBox(
                      height: 10,
                    )
                  ])),
                ],
              ),
            ) : CustomizedScaffold(
              isLoading: false,
              isUsingAppbar: true,
              content: ErrorPage(
                  errorMessage: provider.errorMessage,
                  reloadCallback: () {
                    provider.setErrorMessage("");
                  },
                  backCallback: () {}),
            );
    }));
  }
}
