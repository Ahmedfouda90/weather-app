import 'package:flutter_bloc/flutter_bloc.dart';

import '../Model/WeatherModel.dart';
import 'package:flutter/material.dart';

import '../cubit/weatherCubit.dart';
class SuccessBody extends StatelessWidget {
  final WeatherModel? weatherData;

  SuccessBody({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context)  {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [

          // u can use weatherData instead of provider to get color by the same way
          // weatherData!.getColor(),
          BlocProvider.of<WeatherCubit>(context).weatherModel!.getColor()!,
          BlocProvider.of<WeatherCubit>(context).weatherModel!.getColor()[100]!,
          BlocProvider.of<WeatherCubit>(context).weatherModel!.getColor()[300]!,
          // weatherData!.getColor()[300]!,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(
            // Provider.of<WeatherProvider>(context).cityName!,

            BlocProvider.of<WeatherCubit>(context).weatherModel!.regionName,
            // weatherData!.regionName,
            // this line is work too , wew can access city name from weathredata direct
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 38,
            ),
          ),
          Text(
            'updated at : ${BlocProvider.of<WeatherCubit>(context).weatherModel!.date} ',
            style: const TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                BlocProvider.of<WeatherCubit>(context).weatherModel!.getImage(),
              ),

              Text(
                '${BlocProvider.of<WeatherCubit>(context).weatherModel!.averageTemp.toInt()}',
                //'average temp:${weatherData!.averageTemp.toInt()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'mintemp:${BlocProvider.of<WeatherCubit>(context).weatherModel!.minTemp.toInt()}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'maxtemp:${BlocProvider.of<WeatherCubit>(context).weatherModel!.maxTemp.toInt()}',
                    style: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            BlocProvider.of<WeatherCubit>(context).weatherModel!.condition,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34,
            ),
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
