import 'package:flutter/foundation.dart';

import '../Model/WeatherModel.dart';
/*
class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  String? cityName;

  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}*/
class WeatherProvider extends ChangeNotifier{

  WeatherModel? weatherData;
  // String? cityName;
  WeatherModel? getProvider(WeatherModel weather){
    weatherData=weather;
  }
}
