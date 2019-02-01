import 'package:flutter/material.dart';
import 'package:innovr_app/Pages/SignInPage.dart';

void main() => runApp(Innovr());

class Innovr extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Innovr App',
      theme: ThemeData(
        primaryColor: Color(0xFF5271FF),
        accentColor: Color(0xFFFF5757),
        primaryColorDark: Color(0xFF545454),
        primaryColorLight: Color(0xFFD9D9D9),
      ),
      home: SignInPage()
    );
  }
}


