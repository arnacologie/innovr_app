import 'package:flutter/material.dart';
import 'package:innovr_app/Tabs/HomeTab.dart';
import 'package:innovr_app/Tabs/LiveTab.dart';
import 'package:innovr_app/Tabs/ThirdTab.dart';
import 'package:video_player/video_player.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> with TickerProviderStateMixin {
  static bool isVRActivated = false;
  static const _aDuration = const Duration(milliseconds: 350);
  TabController _tabController;
  Animation _opacityAnimation1;
  Animation _opacityAnimation2;
  AnimationController _animationController;
  VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _aDuration);
    _opacityAnimation1 = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _opacityAnimation2 = Tween(begin: 1.0, end: 0.0).animate(_animationController);
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_tabListener);
    _videoController = VideoPlayerController.asset('assets/videos/esl_finals.mp4')
      ..setVolume(0.0)
      ..initialize().then((_){
        setState(() {_videoController.play();});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _animationController.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: TabBarView(
              controller: _tabController,
              children: [HomeTab(), LiveTab(_videoController), ThirdTab()]),
          bottomNavigationBar: FadeTransition(
              opacity: _opacityAnimation2,
              child: !(_tabController.index == 1)
                  ? TabBar(
                  controller: _tabController,
                  labelColor: Colors.blueAccent,
                  indicatorColor: Colors.red,
                  tabs: [
                    Tab(icon: Icon(Icons.home)),
                    Tab(icon: Icon(Icons.live_tv)),
                    Tab(icon: Icon(Icons.record_voice_over)),
                  ])
                  : SizedBox(),
          ),
          floatingActionButton: FadeTransition(
            opacity: _opacityAnimation1,
            child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        isVRActivated = !isVRActivated;
                      });
                    },
                    tooltip: 'Activer le mode VR',
                    child: Icon(Icons.threed_rotation),
                  )
          )),
    );
  }

  _tabListener() {
    if(_tabController.index == 1) {
      _animationController.forward();
      _videoController.setVolume(1.0);
    }
    else {
      _animationController.reverse();
      _videoController.setVolume(0.0);
    }
    setState(() {});
  }
}
