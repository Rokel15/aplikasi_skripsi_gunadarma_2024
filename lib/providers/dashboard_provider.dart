import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/models/open_weather_model.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/global_provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/services/auth_service.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/services/firestore_service.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/widgets/map_screen/input_data_dialog.dart';
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
  double? targetLat;
  double? targetLon;
  OpenWeatherModel? weatherData;
  bool isLoading = false;

  void setLocation({
    required double latitude,
    required double longitude,
  }) async {
    this.latitude = await latitude.toString();
    this.longitude = await longitude.toString();
    this.targetLat = await latitude;
    this.targetLon = await longitude;
    notifyListeners();
  }

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

  // Completer<GoogleMapController> gMapController = Completer();

  void seeMap(BuildContext context){
    Navigator.pushNamed(context, "/map screen type 2");
    notifyListeners();
  }

  TextEditingController inputNameController = TextEditingController();
  TextEditingController inputDescController = TextEditingController();
  TextEditingController inputLatController = TextEditingController();
  TextEditingController inputLonController = TextEditingController();

  addData() async{
    await collectionReference.add({
      "uid" : uid,
      "latitude" : double.parse(inputLatController.text),
      "longitude" : double.parse(inputLonController.text),
      "name" : inputNameController.text,
      "desc" : inputDescController.text,
    });
    inputNameController.text = "";
    inputDescController.text = "";
    inputLatController.text = "";
    inputLonController.text = "";
    notifyListeners();
  }

  addLocation(BuildContext context){
    inputLatController.text = targetLat.toString();
    inputLonController.text = targetLon.toString();
    return InputDataDialog(
      inputNameController: inputNameController,
      inputDescController: inputDescController,
      inputLatController: inputLatController,
      inputLonController: inputLonController,
      textStyle: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,
      addData: () async{
        await addData();
        Navigator.pop(context);
      }
    );
  }
}