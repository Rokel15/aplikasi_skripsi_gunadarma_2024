import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/models/open_weather_model.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/services/auth_service.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/services/location_service.dart';
import '../services/open_weather_service.dart';

class DashboardProvider extends ChangeNotifier {
  String profileIcon = "images/user.png";

  void logout(BuildContext context) async {
    await AuthService().signOut(context: context);
    SystemNavigator.pop();
  }

  String get email => AuthService().user!.email!;
  String get uid => AuthService().user!.uid;
  LocationService locationService = LocationService();

  @override
  void dispose() {
    locationService.dispose();
    super.dispose();
  }

  String? latitude;
  String? longitude;

  void setLocation({
    required double latitude,
    required double longitude,
  }) async {
    this.latitude = await latitude.toString();
    this.longitude = await longitude.toString();
    notifyListeners();
  }

  Stream<OpenWeatherModel> fetchWeatherData() async*{
    notifyListeners();
    while(true){
      yield await OpenWeatherService().
      getWeather(
        lat: this.latitude.toString(),
        lon: this.longitude.toString(),
      );
      await Future.delayed(const Duration(seconds: 10));
      print("object");
      notifyListeners();
    }
  }
}