import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ErrorPage extends StatefulWidget {
  final String errorMessage;
  final Function reloadCallback;
  final Function backCallback;

  ErrorPage(
      {required this.errorMessage,
      required this.reloadCallback,
      required this.backCallback});

  @override
  State<StatefulWidget> createState() {
    return _ErrorPageState();
  }
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Text(widget.errorMessage)),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    widget.reloadCallback();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text("Refresh"),
                  )),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    widget.backCallback();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text("Kembali"),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
