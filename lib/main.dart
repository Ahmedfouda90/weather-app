import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/HomePage.dart';
import 'WeatherServices/Services.dart';
import 'cubit/weatherCubit.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherServices());
      },
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel == null
            ?
        Colors.blue
            : BlocProvider.of<WeatherCubit>(context).weatherModel!.getColor(), )
    );
  }
}
