import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/models/open_weather_model.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/services/auth_service.dart';
import '../services/location_service.dart';
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
  OpenWeatherModel? weatherData;
  bool isLoading = false;

  void setLocation({
    required double latitude,
    required double longitude,
  }) async {
    this.latitude = await latitude.toString();
    this.longitude = await longitude.toString();
    notifyListeners();
  }

  // Future fetchWeatherData(
  //     // {required String lat, required String lon}
  //     ) async{
  //   await OpenWeatherService().getWeather(
  //     lat: latitude.toString(),
  //     lon: longitude.toString(),
  //   );
  //   notifyListeners();
  // }

  void getWeatherData() async{
    while(true){
      await fetchWeatherData();
      await Future.delayed(const Duration(seconds: 3));
      notifyListeners();
    }
  }

  Future<void> fetchWeatherData() async{
    if(latitude != null && longitude != null){
      isLoading = true;
      notifyListeners();
      try{
        weatherData = await OpenWeatherService().getWeather(
          lat: latitude!,
          lon: longitude!,
        );
      }catch(e){}
      finally{
        isLoading = false;
        notifyListeners();
      }
      notifyListeners();
    }
  }
}