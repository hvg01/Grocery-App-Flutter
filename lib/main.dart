import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceries_app/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries_app/checkOutPage.dart';

void main() {
  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(int.parse("0xFF50c0bb")),
    statusBarBrightness: Brightness.light,
  ));
}

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      home: HomePage(),
      routes: {
        '/subscribe':(context)=>Subscribed(),
      },
    );
  }
}

