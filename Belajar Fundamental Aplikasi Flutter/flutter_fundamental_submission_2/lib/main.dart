import 'package:flutter/material.dart';
import 'package:flutter_fundamental_submission_1/provider/detail_provider.dart';
import 'package:flutter_fundamental_submission_1/provider/main_provider.dart';
import 'package:flutter_fundamental_submission_1/ui/restaurant_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'ui/restaurant_list.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (c) => MainProvider()),
      ChangeNotifierProvider(create: (c) => DetailProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline1: GoogleFonts.roboto(
                fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
            headline2: GoogleFonts.roboto(
                fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
            headline3:
                GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w400),
            headline4: GoogleFonts.roboto(
                fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            headline5:
                GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w400),
            headline6: GoogleFonts.roboto(
                fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
            subtitle1: GoogleFonts.roboto(
                fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15),
            subtitle2: GoogleFonts.roboto(
                fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.1),
            bodyText1: GoogleFonts.roboto(
                fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
            bodyText2: GoogleFonts.roboto(
                fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            button: GoogleFonts.roboto(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
            caption: GoogleFonts.roboto(
                fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
            overline: GoogleFonts.roboto(
                fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
          )),
      home: RestaurantList(),
    );
  }
}
