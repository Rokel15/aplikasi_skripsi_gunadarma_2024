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

  // Stream<OpenWeatherModel> fetchWeatherData({
  //   required String latitude,
  //   required String longitude,
  // }) async* {
  //   notifyListeners();
  //   while (true) {
  //     // if(latitude != null && longitude != null){
  //     // try {
  //       yield await OpenWeatherService().getWeather(
  //         lat: latitude,
  //         lon: longitude,
  //       );
  //       print("fetch data");
  //       print(latitude);
  //       print(longitude);
  //       await Future.delayed(const Duration(seconds: 2));
  //       notifyListeners();
  //     // } catch (e) {}
  //   }
  // }

  // Future fetchWeatherData(
  //     // {required String lat, required String lon}
  //     ) async{
  //   await OpenWeatherService().getWeather(
  //     lat: latitude.toString(),
  //     lon: longitude.toString(),
  //   );
  //   notifyListeners();
  // }

  // void fetchWeatherDataa(
  //     // {required String lat, required String lon}
  //     ) async{
  //   await OpenWeatherService().getWeather(
  //     lat: latitude.toString(),
  //     lon: longitude.toString(),
  //   );
  //   notifyListeners();
  // }

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


    // Stream<OpenWeatherModel> fetchWeatherData() async*{
    //   notifyListeners();
    //   // while(true){
    //   //   yield await OpenWeatherService().
    //   //   getWeather(
    //   //     lat: latitude!,
    //   //     lon: longitude!,
    //   //   );
    //   weatherData = await OpenWeatherService().
    //   getWeather(lat: latitude!, lon: longitude!);
    //     await Future.delayed(const Duration(seconds: 2));
    //     print("fetch data\n");
    //     notifyListeners();
    //   }
}