import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fundamental_submission_1/ui/search_restaurant.dart';

class CustomizedScaffold extends StatefulWidget {
  final bool isLoading;
  final Widget? content;
  final bool isUsingAppbar;
  final bool? haveActions;

  CustomizedScaffold(
      {required this.isLoading,
      this.content,
      required this.isUsingAppbar,
      this.haveActions});

  @override
  State<StatefulWidget> createState() {
    return _CustomizedScaffoldState();
  }
}

class _CustomizedScaffoldState extends State<CustomizedScaffold> {
  @override
  Widget build(BuildContext context) {
    return (widget.isLoading)
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: widget.isUsingAppbar
                ? AppBar(
                    backgroundColor: Colors.white,
                    iconTheme: IconThemeData(
                      color: Colors.black, //change your color here
                    ),
                    elevation: 0,
                    actions: [
                      (widget.haveActions ?? false)
                          ? Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SearchRestaurant()));
                                },
                                child: Icon(
                                  Icons.search,
                                  size: 26.0,
                                ),
                              ))
                          : Container(),
                    ],
                  )
                : PreferredSize(
                    preferredSize:
                        Size.fromHeight(0), // here the desired height
                    child: Container()),
            body: widget.content ?? Container(),
          );
  }
}
