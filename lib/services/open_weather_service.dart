import 'package:dio/dio.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/models/open_weather_model.dart';

class OpenWeatherService{
  Dio dio = Dio();
  String apiKey = "f9dd813628f9761858df7e06363ec520";

  Future<OpenWeatherModel> getWeather({
    required String lat,
    required String lon,
  }) async{
    try{
      final response = await dio.
      get("https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=f9dd813628f9761858df7e06363ec520");
      return OpenWeatherModel.fromJson(response.data);
    } catch(e){
      rethrow;
    }
  }
}