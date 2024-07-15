import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/services/auth_service.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/services/location_service.dart';

class DashboardProvider extends ChangeNotifier{


  String profileIcon = "images/user.png";

  void logout(BuildContext context) async{
    await AuthService().signOut(context: context);
    SystemNavigator.pop();
  }

  String get email => AuthService().user!.email!;
  String get uid => AuthService().user!.uid;


}