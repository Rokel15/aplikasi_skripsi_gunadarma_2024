import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/services/auth_service.dart';

class DashboardProvider extends ChangeNotifier{
  String profileIcon = "images/user.png";

  void logout(BuildContext context) async{
    await AuthService().signout(context: context);
    SystemNavigator.pop();
  }
}