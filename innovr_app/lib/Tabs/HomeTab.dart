import 'package:flutter/material.dart';
import 'package:innovr_app/Utils/TileHomeTab.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  static const kDuration = const Duration(milliseconds: 1400);
  final _childCount = 8;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: kDuration);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorDark,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            expandedHeight: 200.0,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
                  child: Image.asset(
                    'assets/logos/logo.png',
                  )),
            ),
            leading: Icon(Icons.search, color: Colors.black,),
            centerTitle: true,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () {},
                  child: Icon(Icons.person, color: Colors.black,),
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
                return TileHomeTab(_animationController, index, _childCount);
              },
              childCount: _childCount,
              // Or, uncomment the following line:
              // childCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
