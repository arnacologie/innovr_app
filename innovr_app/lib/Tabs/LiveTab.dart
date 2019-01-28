import 'package:flutter/material.dart';

class LiveTab extends StatefulWidget {
  @override
  _LiveTabState createState() => _LiveTabState();
}

class _LiveTabState extends State<LiveTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Text('LIVE', style: TextStyle(fontSize: 40),)
        )
    );
  }
}
