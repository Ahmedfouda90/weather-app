import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../Model/WeatherModel.dart';
import '../cubit/weatherCubit.dart';
import '../cubit/weeatherState.dart';
import '../widgets/success-body.dart';
import 'SearchPage.dart';
import 'SearchPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData;
    return Scaffold(
      // backgroundColor: Colors.transparent,
       /* backgroundColor:
            BlocProvider.of<WeatherCubit>(context).weatherModel == null
                ? Colors.blue
                : BlocProvider.of<WeatherCubit>(context).weatherModel!.getColor(),*/
        appBar: AppBar(
          // backgroundColor: Colors.orangeAccent,
          title: Text('Weather app with  tharwat 1/5/2023'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(/*updateUi: updateUi*/),
                  ),
                );
              },
            ),
          ],
        ),
        body:
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return SuccessBody(
              weatherData: weatherData,
            );
          } else if (state is WeatherFailure) {
            return const Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  'something went wrong , please try again ',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  'there is no weather now .\ start searching now ',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }
        }));
  }
}


/*
        Provider.of<WeatherProvider>(context).weatherData != null ? Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    // u can use weatherData instead of provider to get color by the same way
                    Provider.of<WeatherProvider>(context)
                        .weatherData!
                        .getColor(),
                    Provider.of<WeatherProvider>(context)
                        .weatherData!
                        .getColor()[300]!,
                    Provider.of<WeatherProvider>(context)
                        .weatherData!
                        .getColor()[100]!,
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

                      weatherData!.regionName,
                      // this line is work too , wew can access city name from weathredata direct
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 38,
                      ),
                    ),
                    Text(
                      'updated at : ${weatherData.date} ',
                      style: const TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(Provider.of<WeatherProvider>(context)
                            .weatherData!
                            .getImage()),
                        Text(
                          '${Provider.of<WeatherProvider>(context).weatherData!.averageTemp.toInt()}',
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
                              'mintemp:${Provider.of<WeatherProvider>(context).weatherData!.minTemp.toInt()}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'maxtemp:${Provider.of<WeatherProvider>(context).weatherData!.maxTemp.toInt()}',
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
                      Provider.of<WeatherProvider>(context)
                          .weatherData!
                          .condition,
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
              )
            : const Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    'there is no weather now .\ start searching now ',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ));*/
