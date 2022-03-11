import 'package:flutter/material.dart';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? firebaseUser = FirebaseAuth.instance.currentUser;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  void signUp({required Map<String, dynamic> userData, required String pass,
      required VoidCallback onSuccess, required VoidCallback onFail}){
    isLoading = true;
    notifyListeners();

    _auth.createUserWithEmailAndPassword(
      email: userData["email"].trim(),
      password: pass,
    ).then((authResult) async{
      firebaseUser = authResult.user;

      await _saveUserData(userData);

      onSuccess;
      isLoading = false;
      notifyListeners();
    }).catchError((e){
      onFail;
      isLoading = false;
      notifyListeners();
    });
  }

  void signIn() async{
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    notifyListeners();
  }

  void signOut() async{
    await _auth.signOut();

    userData = Map();
    firebaseUser = null;

    notifyListeners();
  }

  void recoverPass(){

  }

  bool isLoggedIn(){
    return firebaseUser != null;
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async{
    this.userData = userData;
    await FirebaseFirestore.instance.collection("users").doc(firebaseUser!.uid).set(userData);
  }

}