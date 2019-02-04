import 'dart:math';

import 'package:flutter/material.dart';
import 'package:innovr_app/Pages/FirstTimePage.dart';

class TileHomeTab extends StatefulWidget {

  const TileHomeTab(this.animationController, this.index, this.childCount);
  final int index;
  final AnimationController animationController;
  final int childCount;

  @override
  _TileHomeTabState createState() => _TileHomeTabState();
}

class _TileHomeTabState extends State<TileHomeTab> {
  Animation _animation;
  int hour = 15;

  @override
  void initState() {
    super.initState();
    _animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(parent: widget.animationController, curve: Interval(1/widget.childCount*widget.index, 1.0, curve: Curves.fastLinearToSlowEaseIn)));
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height-300.0;
    widget.animationController.forward();
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget child){
        return Transform(
          transform: Matrix4.translationValues(0.0, _animation.value*height, 0.0),
          child: Container(
              padding: EdgeInsets.all(15.0),
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: widget.index%2==0 ? Theme.of(context).primaryColor : Theme.of(context).accentColor.withOpacity(0.85),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Text('${hour+widget.index}h00', style: TextStyle(fontFamily: 'Montserrat'),),
                    ),
                    ListTile(
                      leading: Image(
                        image: AssetImage(FirstTimePageState.teamImages[widget.index%FirstTimePageState.teamNames.length]),
                        width: 30,
                        height: 30,
                      ),
                    title: Text(FirstTimePageState.teamNames[widget.index%FirstTimePageState.teamNames.length],
                        style: TextStyle(fontFamily: 'Montserrat', color: Colors.white)),
                    ),
                    ListTile(
                      leading: Image(
                        image: AssetImage(FirstTimePageState.teamImages[(widget.index+1)%FirstTimePageState.teamNames.length]),
                        width: 30,
                        height: 30,
                      ),
                      title: Text(FirstTimePageState.teamNames[(widget.index+1)%FirstTimePageState.teamNames.length],
                        style: TextStyle(fontFamily: 'Montserrat', color: Colors.white)),
                    ),
                  ],
                ),
              )
          ),
        );
      },
    );
  }
}

//Text('MATCH ${widget.index} : EQUIPE ${widget.index} VS EQUIPE ${widget.index}')