import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
                padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
                child: Image.asset(
                  'assets/logos/logo.png',
                )
            ),
          ),
          leading: Icon(Icons.search),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right:20),
              child: InkWell(
                onTap: (){},
                child: Icon(Icons.person),
              ),
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              // To convert this infinite list to a list with three items,
              // uncomment the following line:
              // if (index > 3) return null;
              return Container(
                padding: EdgeInsets.all(25.0),
                child:Text('MATCH $index : EQUIPE ${index} VS EQUIPE ${index}')
              );
            },
            // Or, uncomment the following line:
            // childCount: 3,
          ),
        )
      ],
    );
  }
}
