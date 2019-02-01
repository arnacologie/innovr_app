import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';


/*
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);

    animation = Tween(begin: 200.0, end: 25.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));


  }

  @override
  Widget build(BuildContext context) {


    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return new Scaffold(
            body: new Center(
              child: ListView.builder(
                itemBuilder: (context, int index){
                  return Padding(
                    padding: EdgeInsets.only(top:animation.value, left: animation.value, right: animation.value),
                    child: Container(
                      color: Colors.red,
                    ),
                  );
                },
                itemExtent: 100.0,
                itemCount: 5,
              ),
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.leak_remove),
                onPressed: (){
                  if(animation.value == 200.0)
                    animationController.forward();
                  else if (animation.value == 25.0)
                    animationController.reverse();
                }),
          );
        });
  }
}*/

/*return Container(
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
    );*/