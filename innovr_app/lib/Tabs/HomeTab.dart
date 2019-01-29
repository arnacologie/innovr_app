import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 350,
                height: 250,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/graphics/LoL.jpg'))
                    ))
            ),
          ],
        )
    );
  }
}
