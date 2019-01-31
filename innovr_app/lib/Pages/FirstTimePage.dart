import 'package:flutter/material.dart';

class FirstTimePage extends StatefulWidget {
  @override
  _FirstTimePageState createState() => _FirstTimePageState();
}

class _FirstTimePageState extends State<FirstTimePage> {
  String appBarTitle = 'Choisis des équipes à suivre';
  List<String> teamNames = ['Fnatic' , 'Cloud 9', 'Team Envy', 'G2 Esports', 'Ninjas In Pyjamas', 'Rogue'];
  List<String> teamImages = ['assets/graphics/teams/fnatic.png', 'assets/graphics/teams/cloud.png', 'assets/graphics/teams/envy.png', 'assets/graphics/teams/g2.png', 'assets/graphics/teams/nip.png', 'assets/graphics/teams/rogue.png'];
  List<String> playerImages = ['assets/graphics/players/coldzera.jpg', 'assets/graphics/players/KRiMZ.jpg', 'assets/graphics/players/NAF.jpg', 'assets/graphics/players/NiKo.jpg', 'assets/graphics/players/s1mple.jpg', 'assets/graphics/players/suNny.jpg'];
  List<String> playerNames = ['coldzera', 'KRiMZ', 'NAF' , 'NiKo', 's1mple', 'suNny'];
  List<String> playerTeams = ['Made In Brazil', 'Fnatic', 'Team Liquid', 'FaZe Clan','Natus Vincere','Mousesports'];
  List<bool> isFavTeams = [false, false,false,false, false, false];
  List<bool> isFavPlayers = [false, false,false,false, false, false];
  List<String> selectedTeams;
  List<String> selectedPlayers;
  static const TEAMS = 'TEAMS';
  static const PLAYERS = 'PLAYERS';
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    selectedTeams = List<String>();
    selectedPlayers = List<String>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(
          width: 30,
          child: FlatButton(
            child: Text('Next'),
            onPressed: () {
              _pageController.nextPage(duration: _kDuration, curve: _kCurve);
            },
          ),
        ),
        title: Text(appBarTitle),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: Colors.black87,
      child: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildTeamsList(),
          Container(padding: EdgeInsets.only(top: 10.0),child: _buildPlayerList()),
        ],
      ),
      ),
    );
  }

  Widget _buildTeamsList(){
    return ListView.builder(
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          leading: Image(
            image:AssetImage(teamImages[index]),
            width: 50,
            height: 50,
          ),
          title: Text(teamNames[index], style: TextStyle(color: Colors.white, fontSize: 18.0),),
          trailing: GestureDetector(
            child: Container(
              padding: EdgeInsets.all(9.0),
              width: 50,
              height: 50,
              child: Image(
                image: isFavTeams[index] ? AssetImage('assets/graphics/icons/heart_full.png'): AssetImage('assets/graphics/icons/heart.png'),
                fit: BoxFit.scaleDown,
              ),
            ),
            onTap: (){setState((){});_addSelectedTP(TEAMS,index); },
          ),
        );
      },
      itemExtent: 80.0,
      itemCount: teamNames.length,
    );
  }

  Widget _buildPlayerList(){
    return ListView.builder(
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          leading: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2.0)
            ),
            child: Image(
              image:AssetImage(playerImages[index]),
              width: 70,
              height: 70,
            ),
          ),
          title: Text(playerNames[index], style: TextStyle(color: Colors.white, fontSize: 18.0),),
          subtitle: Text(playerTeams[index], style: TextStyle(color: Colors.grey, fontSize: 15.0),),
          trailing: GestureDetector(
            child: Container(
              padding: EdgeInsets.all(9.0),
              width: 50,
              height: 50,
              child: Image(
                image: isFavPlayers[index] ? AssetImage('assets/graphics/icons/heart_full.png'): AssetImage('assets/graphics/icons/heart.png'),
                fit: BoxFit.scaleDown,
              ),
            ),
            onTap: (){setState((){});_addSelectedTP(PLAYERS,index); },
          ),
        );
      },
      itemExtent: 100.0,
      itemCount: playerNames.length,
    );
  }
  _addSelectedTP(String tag, int index){
    if(tag == TEAMS) {
      isFavTeams[index] = !isFavTeams[index];
      if (isFavTeams[index])
        selectedTeams.add(teamNames[index]);
      else
        selectedTeams.remove(teamNames[index]);
      for (String team in selectedTeams)
        print('$team\n');
    }
    else if(tag == PLAYERS) {
      isFavPlayers[index] = !isFavPlayers[index];
      if (isFavPlayers[index])
        selectedPlayers.add(playerNames[index]);
      else
        selectedPlayers.remove(playerNames[index]);
      for (String player in selectedPlayers)
        print('$player\n');
    }
  }
}
