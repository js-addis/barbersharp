import 'package:flutter/material.dart';
import 'package:barbershop_app/ui/landing_page.dart';

void main() async {
  runApp(new BarberShopApp());
}

class BarberShopApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    var materialApp = new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.pinkAccent,
      ),
      home: new LandingPage(),
    );
    return materialApp;
  }
}
