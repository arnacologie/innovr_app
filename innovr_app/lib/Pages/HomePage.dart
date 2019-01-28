import 'package:flutter/material.dart';
import 'package:innovr_app/Tabs/HomeTab.dart';
import 'package:innovr_app/Tabs/LiveTab.dart';
import 'package:innovr_app/Tabs/ThirdTab.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              leading: Icon(Icons.search),
              title: Text(widget.title),
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
            tooltip: 'Activer le mode VR',
            child: Icon(Icons.threed_rotation),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}