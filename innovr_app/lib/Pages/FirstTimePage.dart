import 'dart:async';

import 'package:flutter/material.dart';
import 'package:innovr_app/Database/UserManagement.dart';
import 'package:innovr_app/Pages/MainPage.dart';
import 'package:innovr_app/Utils/FadeNavRoute.dart';

class FirstTimePage extends StatefulWidget {
  @override
  FirstTimePageState createState() => FirstTimePageState();
}

class FirstTimePageState extends State<FirstTimePage>
    with TickerProviderStateMixin {
  static List<String> teamNames = [
    'Fnatic',
    'Cloud 9',
    'Team Envy',
    'G2 Esports',
    'Ninjas In Pyjamas',
    'Rogue'
  ];
  static List<String> teamImages = [
    'assets/graphics/teams/fnatic.png',
    'assets/graphics/teams/cloud.png',
    'assets/graphics/teams/envy.png',
    'assets/graphics/teams/g2.png',
    'assets/graphics/teams/nip.png',
    'assets/graphics/teams/rogue.png'
  ];
  List<String> playerImages = [
    'assets/graphics/players/coldzera.jpg',
    'assets/graphics/players/KRiMZ.jpg',
    'assets/graphics/players/NAF.jpg',
    'assets/graphics/players/NiKo.jpg',
    'assets/graphics/players/s1mple.jpg',
    'assets/graphics/players/suNny.jpg'
  ];
  List<String> playerNames = [
    'coldzera',
    'KRiMZ',
    'NAF',
    'NiKo',
    's1mple',
    'suNny'
  ];
  List<String> playerTeams = [
    'Made In Brazil',
    'Fnatic',
    'Team Liquid',
    'FaZe Clan',
    'Natus Vincere',
    'Mousesports'
  ];
  List<bool> isFavTeams = [false, false, false, false, false, false];
  List<bool> isFavPlayers = [false, false, false, false, false, false];
  bool isTabPlayers = false;
  bool _isBackDisabled = true;
  List<String> selectedTeams;
  List<String> selectedPlayers;
  static const TEAMS = 'TEAMS';
  static const PLAYERS = 'PLAYERS';
  static const _kDuration = const Duration(milliseconds: 400);
  static const _aDuration = const Duration(milliseconds: 350);
  static const _a2Duration = const Duration(milliseconds: 350);
  static const _kCurve = Curves.ease;
  final PageController _pageController = PageController();
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    selectedTeams = List<String>();
    selectedPlayers = List<String>();
    _pageController.addListener(_printCurrentPage);
    _animationController =
        AnimationController(vsync: this, duration: _aDuration);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    print(isTabPlayers);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: <Widget>[
          Container(
            width: 65,
            child: AnimatedSwitcher(
              child: isTabPlayers
                  ? FlatButton(
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                      onPressed: _launchMainPage,
                    )
                  : FlatButton(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _pageController.nextPage(
                            duration: _kDuration, curve: _kCurve);
                      }),
              duration: Duration(milliseconds: 400),
            ),
          ),
        ],
        leading: FadeTransition(
          opacity: _animation,
          child: FlatButton(
            child: Icon(
              Icons.keyboard_backspace,
              color: Colors.white,
            ),
            onPressed: _isBackDisabled
                ? null
                : () {
                    _pageController.previousPage(
                        duration: _kDuration, curve: _kCurve);
                  },
          ),
        ),
        title: AnimatedSwitcher(
          child: isTabPlayers
              ? Text(
                  'Choisis des joueurs à suivre',
                  key: UniqueKey(),
                )
              : Text('Choisis des équipes à suivre', key: UniqueKey()),
          duration: Duration(milliseconds: 350),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: Colors.black87,
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _buildTeamsList(),
            _buildPlayerList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamsList() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image(
              image: AssetImage(teamImages[index]),
              width: 70,
              height: 70,
            ),
            title: Text(
              teamNames[index],
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            trailing: GestureDetector(
              child: Container(
                padding: EdgeInsets.all(9.0),
                width: 50,
                height: 50,
                child: Image(
                  image: isFavTeams[index]
                      ? AssetImage('assets/graphics/icons/heart_full.png')
                      : AssetImage('assets/graphics/icons/heart.png'),
                  fit: BoxFit.scaleDown,
                ),
              ),
              onTap: () {
                setState(() {});
                _addSelectedTP(TEAMS, index);
              },
            ),
          );
        },
        itemExtent: 100.0,
        itemCount: teamNames.length,
      ),
    );
  }

  Widget _buildPlayerList() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2.0)),
              child: Image(
                image: AssetImage(playerImages[index]),
                width: 70,
                height: 70,
              ),
            ),
            title: Text(
              playerNames[index],
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            subtitle: Text(
              playerTeams[index],
              style: TextStyle(color: Colors.grey, fontSize: 15.0),
            ),
            trailing: GestureDetector(
              child: Container(
                padding: EdgeInsets.all(9.0),
                width: 50,
                height: 50,
                child: Image(
                  image: isFavPlayers[index]
                      ? AssetImage('assets/graphics/icons/heart_full.png')
                      : AssetImage('assets/graphics/icons/heart.png'),
                  fit: BoxFit.scaleDown,
                ),
              ),
              onTap: () {
                setState(() {});
                _addSelectedTP(PLAYERS, index);
              },
            ),
          );
        },
        itemExtent: 100.0,
        itemCount: playerNames.length,
      ),
    );
  }

  _addSelectedTP(String tag, int index) {
    if (tag == TEAMS) {
      isFavTeams[index] = !isFavTeams[index];
      if (isFavTeams[index])
        selectedTeams.add(teamNames[index]);
      else
        selectedTeams.remove(teamNames[index]);
      for (String team in selectedTeams) print('$team\n');
    } else if (tag == PLAYERS) {
      isFavPlayers[index] = !isFavPlayers[index];
      if (isFavPlayers[index])
        selectedPlayers.add(playerNames[index]);
      else
        selectedPlayers.remove(playerNames[index]);
      for (String player in selectedPlayers) print('$player\n');
    }
  }

  void _printCurrentPage() {
    if (_pageController.page == 0.0) {
      isTabPlayers = false;
      _animationController.reverse();
      _isBackDisabled = true;
      setState(() {});
      print(isTabPlayers);
    }else if( _pageController.page == 1.0){
      isTabPlayers = true;
      _animationController.forward();
      _isBackDisabled = false;
      setState(() {});
      print(isTabPlayers);
    }
  }

  Future<Null> _launchMainPage() async {
    //TODO change isNew to false after FirstTimePage
    await UserManagement.afterFirstTime(selectedTeams, selectedPlayers);
    Navigator.of(context).pushReplacement(FadeNavRoute(builder: (context) => MainPage()));
  }

}
