import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import '../Model/WeatherModel.dart';
class WeatherServices {
  WeatherModel? weather;
  String? cityName;

  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'fb91446bafe3407d95785520231402';

  Future<WeatherModel?> getWeather({required  cityName}) async {
WeatherModel? weather;
    // try{
      Uri url =
      Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
       weather = WeatherModel.fromJson(data);
    // }catch(ex){
    //   print (ex);
    // }

    return weather;
  }
}
