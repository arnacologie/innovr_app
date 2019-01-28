import 'package:flutter/material.dart';

class ThirdTab extends StatefulWidget {
  @override
  _ThirdTabState createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Text('Onglet 3', style: TextStyle(fontSize: 40),)
        )
    );
  }
}
