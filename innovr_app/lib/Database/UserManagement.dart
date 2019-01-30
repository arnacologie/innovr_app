import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:innovr_app/Pages/HomePage.dart';
import 'package:innovr_app/Utils/FadeNavRoute.dart';

class UserManagement {
  static final db = Firestore.instance;
  static storeNewUser(signedUser, nickname, context) {
    db.collection('/users/').add({
      'email': signedUser.email,
      'uid': signedUser.uid,
      'nickname': nickname,
      'gameNickname' : '',
      'favTeams': [],
      'favPlayers': [],
      'numberOfVisits': 0,
      'isAndroid' : Platform.isAndroid ? true : false,
      'isNew': true,
    }).then((value) {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacement(FadeNavRoute(builder: (context) => HomePage(user: signedUser)));
    }).catchError((e) {
      print(e);
    });
  }
  
  static findNickName() {
    db.collection('/users/')
        .where('nickname', isEqualTo: "Lenjake6666")
        .snapshots()
        .listen(
            (data) => print('${data.documents[0].data['email']}')
    );
  }
}