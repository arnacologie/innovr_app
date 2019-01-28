import 'package:flutter/material.dart';
import 'package:innovr_app/Pages/HomePage.dart';

void main() => runApp(Innovr());

class Innovr extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Innovr App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Innovr'),
    );
  }
}


