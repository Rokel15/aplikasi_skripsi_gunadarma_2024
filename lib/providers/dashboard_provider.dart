import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/models/open_weather_model.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/global_provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/services/auth_service.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/services/firestore_service.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/services/gemini_service.dart';
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

  String landAnalyticHead = "Land Analytic";
  String submitButtonText = "Submit";
  String soilTypeLabel = "Soil Type :";
  String moistureLevelLabel = "Moisture Level :";
  String pHLevelLabel = "pH Level :";
  String selectSoilType = "Select Soil Type";
  String selectMoistureLevel = "Select Moisture Level";
  String selectPHLevel = "Select pH Level";
  List<String> soilTypeItems = [
    "Select Soil Type", "Clay", "Sand", "Silt", "Loam", "Gambut", "Laterite"];
  List<String>  moistureLevelItems = [
    "Select Moisture Level", "Dry, 10%", "Slightly, Dry 10% - 20%", "Moist, 20% - 40%", "Wet, 40% - 60%", "Very Wet, > 60%"
  ];
  List<String>  pHLevelItems = [
    "Select pH Level",
    "Very Acidic: pH < 4.5",
    "Acidic: pH 4.5 - 5.5",
    "Slightly Acidic: pH 5.5 - 6.5",
    "Neutral: pH 6.5 - 7.5",
    "Slightly Alkaline: pH 7.5 - 8.5",
    "Alkaline: pH 8.5 - 9.5",
    "Very Alkaline: pH > 9.5",
  ];

  void onChangedSoilType(String val){
    selectSoilType = val;
    notifyListeners();
  }

  void onChangedMoistureLevel(String val){
    selectMoistureLevel = val;
    notifyListeners();
  }

  void onChangedPHLevel(String val){
    selectPHLevel = val;
    notifyListeners();
  }

  String textFieldLabel = "Additional Comments :";
  TextEditingController additionalCommentsController = TextEditingController();
  String additionalCommentsHintText = "additional comments";
  String analyticResult = "";

  GenerativeModel model = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: GeminiService().apiKey,);

  void getResultFromGemini() async{
    model.generateContent([
      Content.multi([
        // TextPart("i have some information about an area for gardening and please give me analysis about this area"),
        TextPart(
            """i will give you some information about an area 
            and please do analysis this area
            because i am planning to do gardening in this area"""),
        TextPart(weatherData!.main.toString()),
        TextPart(selectSoilType),
        TextPart(selectMoistureLevel),
        TextPart(selectPHLevel),
        TextPart(additionalCommentsController.text),
      ])
    ]).then((value){
      analyticResult = value.text.toString();
      notifyListeners();
    });
    notifyListeners();

    // model.generateContent([
    //   Content.text("")
    // ]); apabila hanya menggunakan 1 part saja
  }

  restartAnalytic(){
    analyticResult = "";
    selectSoilType = "Select Soil Type";
    selectMoistureLevel = "Select Moisture Level";
    selectPHLevel = "Select pH Level";
    additionalCommentsController.text = "";
    notifyListeners();
  }
}