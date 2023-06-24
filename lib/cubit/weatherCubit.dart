
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_cubit/cubit/weeatherState.dart';

import '../Model/WeatherModel.dart';
import '../WeatherServices/Services.dart';

class  WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherServices) : super(WeatherInitial());

  WeatherServices weatherServices;
  WeatherModel? weatherModel;
  String? cityName;


  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherServices.getWeather(cityName: cityName);
      emit(WeatherSuccess());
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
