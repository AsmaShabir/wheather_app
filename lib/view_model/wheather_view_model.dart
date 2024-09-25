

import 'package:flutter/material.dart';
import 'package:wheather_app/repositories/wheather_repository.dart';

import '../data/response/api_response.dart';
import '../model/wheather_model.dart';

class WheatherViewModel with ChangeNotifier{

  final wheatherApi =WheatherApiRepo();
  ApiResponse<WeatherModel> wheatherRes =ApiResponse.loading();

  Weather?  _currentWeather;
  bool _loading =false;

  setWeather( ApiResponse<WeatherModel> response){
    wheatherRes=response;
    notifyListeners();
  }

  Future<void>fetchWeatherApi()async{
    setWeather(ApiResponse.loading());
    wheatherApi.fetchWeather().then((value){
      setWeather(ApiResponse.completed(value));
    }).onError((error,stackTrace){
      setWeather(ApiResponse.error(error.toString()));
    });
  }


}

