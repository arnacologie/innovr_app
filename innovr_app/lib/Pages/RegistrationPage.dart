import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top:80.0, left: 30.0, right: 30.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text('INSCRIPTION',
                    style: TextStyle(
                      fontFamily: 'Megrim',
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0
                    ),),
                ),
               SizedBox(height: 50.0,),
                //EMAIL
                TextField(
                  decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColorDark
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).accentColor)
                      )
                  ),
                ),
                SizedBox(height: 20.0,),
                //MOT DE PASSE
                TextField(
                  decoration: InputDecoration(
                      labelText: 'MOT DE PASSE',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColorDark
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).primaryColor)
                      )
                  ),
                ),
                SizedBox(height: 20.0,),
                //NOM D'AFFICHAGE
                TextField(
                  decoration: InputDecoration(
                      labelText: 'NOM D\'AFFICHAGE',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColorDark
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).primaryColor)
                      )
                  ),
                ),
                SizedBox(height: 40.0,),
                //BOUTON S'INSCRIRE
                Hero(
                  tag: 'CTA',
                  child: Container(
                    height: 50.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Theme.of(context).primaryColor,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20.0),
                        onTap: (){},
                        child: Center(
                            child: Text(
                              'S\'INSCRIRE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'
                              ),
                            )
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                //BOUTON RETOUR
                Hero(
                  tag: 'NO CTA',
                  child: Container(
                    height: 50.0,
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0
                            ),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Center(
                          child: Material(
                            child: Text(
                              'Retour',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
