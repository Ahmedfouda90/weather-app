
import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double maxTemp;
  double minTemp;
  double averageTemp;
  String condition;
  String regionName;

  WeatherModel(
      {required this.minTemp,
      required this.maxTemp,
      required this.averageTemp,
      required this.condition,
      required this.date,
      required this.regionName});

  factory WeatherModel.fromJson(dynamic data) {
    dynamic jsonData = data['forecast']['forecastday'][0]["day"];
    return WeatherModel(
        date: data['location']['localtime'],
        minTemp: jsonData["mintemp_c"],
        maxTemp: jsonData["maxtemp_c"],
        averageTemp: jsonData['avgtemp_c'],
        condition: jsonData["condition"]['text'],
        regionName: data['location']['name']);
  }

  /*@override
  String toString() {
    return 'averagetemp=$averageTemp , mintep=$minTemp , maxtemp=$maxTemp, date=$date , the condition = $condition, the city is $regionName';
  }*/

  String getImage() {
    if (condition == 'Sunny' ||
        condition == 'Clear' ||
        condition == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (condition == 'Blizzard' ||
        condition == 'Patchy snow possible' ||
        condition == 'Patchy sleet possible' ||
        condition == 'Patchy freezing drizzle possible' ||
        condition == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (condition == 'Freezing fog' ||
        condition == 'Fog' ||
        condition == 'Heavy Cloud' ||
        condition == 'Mist' ||
        condition == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (condition == 'Patchy rain possible' ||
        condition == 'Heavy Rain' ||
        condition == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (condition == 'Thundery outbreaks possible' ||
        condition == 'Moderate or heavy snow with thunder' ||
        condition == 'Patchy light snow with thunder' ||
        condition == 'Moderate or heavy rain with thunder' ||
        condition == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
  MaterialColor getColor() {
    if (condition == 'Sunny' ||
        condition == 'Clear' ||
        condition == 'partly cloudy') {
      return Colors.orange;
    } else if (condition == 'Blizzard' ||
        condition == 'Patchy snow possible' ||
        condition == 'Patchy sleet possible' ||
        condition == 'Patchy freezing drizzle possible' ||
        condition == 'Blowing snow') {
      return Colors.blue;
    } else if (condition == 'Freezing fog' ||
        condition == 'Fog' ||
        condition == 'Heavy Cloud' ||
        condition == 'Mist' ||
        condition == 'Fog') {
      return Colors.blueGrey;
    } else if (condition == 'Patchy rain possible' ||
        condition == 'Heavy rain' ||
        condition == 'Showers	') {
      return Colors.blue;
    } else if (condition == 'Thundery outbreaks possible' ||
        condition == 'Moderate or heavy snow with thunder' ||
        condition == 'Patchy light snow with thunder' ||
        condition == 'Moderate or heavy rain with thunder' ||
        condition == 'Moderate rain'
            '' ||
        condition == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
