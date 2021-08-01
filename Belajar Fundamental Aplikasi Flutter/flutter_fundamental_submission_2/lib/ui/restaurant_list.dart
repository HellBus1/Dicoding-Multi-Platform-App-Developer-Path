import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fundamental_submission_1/provider/main_provider.dart';
import 'package:flutter_fundamental_submission_1/ui/error_page.dart';
import 'package:flutter_fundamental_submission_1/widgets/customized_scaffold.dart';
import 'package:flutter_fundamental_submission_1/widgets/restaurant_card.dart';
import 'package:provider/provider.dart';

class RestaurantList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RestaurantListState();
  }
}

class _RestaurantListState extends State<RestaurantList> {
  @override
  void initState() {
    _initialState();
    super.initState();
  }

  _initialState() {
    final provider = Provider.of<MainProvider>(context, listen: false);

    provider.checkConnection().then((result) {
      if (result) {
        print("hasil ${result.toString()}");
        provider.getRestaurant().then((value) {
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
        child: Consumer<MainProvider>(builder: (context, provider, child) {
      return (provider.loadingState)
          ? CustomizedScaffold(
              isLoading: true,
              isUsingAppbar: false,
            )
          : (provider.errorMessage == "")
              ? CustomizedScaffold(
                  isLoading: false,
                  isUsingAppbar: true,
                  haveActions: true,
                  content: CustomScrollView(
                    slivers: [
                      SliverList(
                          delegate: SliverChildListDelegate([
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 12, right: 12),
                          child: Text("Restaurant",
                              style: Theme.of(context).textTheme.headline5),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 10, bottom: 10, left: 12, right: 12),
                          child: Text("Recomendation restaurant for you!",
                              style: Theme.of(context).textTheme.subtitle2),
                        ),
                      ])),
                      SliverList(
                          delegate: SliverChildListDelegate(
                        List.generate(
                            provider.restaurantResult!.restaurants.length,
                            (index) {
                          return RestaurantCard(
                              restaurant: provider
                                  .restaurantResult!.restaurants[index]);
                        }),
                      )),
                      SliverList(
                          delegate: SliverChildListDelegate([
                        SizedBox(
                          height: 10,
                        )
                      ])),
                    ],
                  ))
              : CustomizedScaffold(
                  isLoading: false,
                  isUsingAppbar: true,
                  content: ErrorPage(
                      errorMessage: provider.errorMessage,
                      reloadCallback: () {
                        _initialState();
                      },
                      backCallback: () {}),
                );
    }));
  }
}
