import 'package:dio/dio.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/models/visual_crossing_model.dart';

class VisualCrossingService{
  Dio dio = Dio();

  String apiKey = "JFE9LJC27SLDPSZ3857AD4JA4";

  Future<VisualCrossingModel> getWeaether(
  // {
    // required String city,
  // }
  ) async{
    try{
      final response =  await dio.get("https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Bogor?unitGroup=metric&key=$apiKey&contentType=json");
      return VisualCrossingModel.fromJson(response.data);
    } catch(e){
      rethrow;
    }
  }
}