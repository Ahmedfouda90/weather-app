import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../Model/WeatherModel.dart';
import '../WeatherServices/Services.dart';
import '../cubit/weatherCubit.dart';


class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather app by  tharwat 1/5/2023'),
        actions: const [
          Icon(
            Icons.search,
            size: 40,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName != cityName;
              Navigator.pop(context);
              /*   WeatherServices weatherServices = WeatherServices();
              WeatherModel? weatherModel =
              await weatherServices.getWeather(cityName: cityName);
              Provider
                  .of<WeatherProvider>(context, listen: false)
                  .weatherData =
                  weatherModel; */ //this line to ability to access data from any where whats whay i created the global var

              // Provider.of<WeatherProvider>(context,listen: false).cityName=cityName ; //this line to ability to access data from any where whats whay i created the global var
              // Navigator.pop(context);
              // print(weatherModel!.regionName);
              // print(weatherModel.condition);

              // print(cityName);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 32, vertical: 25),
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  WeatherServices weatherServices = WeatherServices();
                  WeatherModel? weatherModel =
                      await weatherServices.getWeather(cityName: cityName);
                  BlocProvider.of<WeatherCubit>(context)
                      .weatherModel!;
                  print(  BlocProvider.of<WeatherCubit>(context).cityName);
                  //this line to ability to access data from any where whats whay i created the global var
                  // Provider.of<WeatherProvider>(context,listen: false).cityName=cityName ; //this line to ability to access data from any where whats whay i created the global var
                  Navigator.pop(context);
                },
              ),
              labelText: 'add city name',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
// WeatherModel? weatherData;
}

// WeatherModel? weatherData;
