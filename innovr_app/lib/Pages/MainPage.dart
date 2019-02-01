import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:innovr_app/Tabs/HomeTab.dart';
import 'package:innovr_app/Tabs/LiveTab.dart';
import 'package:innovr_app/Tabs/ThirdTab.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, @required this.user}) : super(key: key);

  final FirebaseUser user;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(
              children: [
                HomeTab(),
                LiveTab(),
                ThirdTab()
              ]
          ),
          bottomNavigationBar: TabBar(
              labelColor: Colors.blueAccent,
              indicatorColor: Colors.red,
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.live_tv)),
                Tab(icon: Icon(Icons.record_voice_over)),
              ]
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){},
            tooltip: 'Activer le mode VR',
            child: Icon(Icons.threed_rotation),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}