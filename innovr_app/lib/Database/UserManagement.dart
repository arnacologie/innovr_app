import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:innovr_app/Pages/MainPage.dart';
import 'package:innovr_app/Utils/FadeNavRoute.dart';

class UserManagement {
  static final _db = Firestore.instance;
  static final _auth = FirebaseAuth.instance;
  static FirebaseUser currentUser;

  static Future<FirebaseUser> getCurrentUser() async {
    return await _auth.currentUser();
  }

  static Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser() != null) {
      currentUser = await _auth.currentUser();
      return true;
    } else {
      return false;
    }
  }

  static storeNewUser(FirebaseUser signedUser, String nickname, BuildContext context) {
    _db.collection('/users').add({
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
      Navigator.of(context).pushReplacement(FadeNavRoute(builder: (context) => MainPage(user: signedUser)));
    }).catchError((e) {
      print(e);
    });
  }
  
  static findNickName() {
    _db.collection('/users')
        .where('nickname', isEqualTo: "Lenjake6666")
        .snapshots()
        .listen(
            (data) => print('${data.documents[0].data['email']}')
    );
  }

  //TODO change isNew to false after FirstTimePage
  static Future<Null> afterFirstTime(List<String> selectedTeams, List<String> selectedPlayers) async {
    if (await isLoggedIn()) {
      Query query = _db.collection('/users').where('uid', isEqualTo: currentUser.uid);
      print(currentUser.uid);
      await query.getDocuments().then((value) {
        String documentID = value.documents.first.documentID;
        _db.collection('/users').document(documentID).updateData(
            {'favPlayers': selectedPlayers, 'favTeams': selectedTeams});
      });
    }
  }

  static Future<bool> isUserFirstTime() async {

    print('ok');
    int result;
    if(await isLoggedIn()){
      Query query = _db.collection('/users')
          .where('uid', isEqualTo: currentUser.uid)
          .where('isNew', isEqualTo : true);
      print(currentUser.uid);
      await query.getDocuments().then((value) {
        result = value.documents.length;
      });
    if(result>0)
      return true;
    else
      return false;
  }
  }
}