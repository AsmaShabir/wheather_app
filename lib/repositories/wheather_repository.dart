

import 'package:wheather_app/data/network/baseapi_service.dart';
import 'package:wheather_app/data/network/networkapi_service.dart';
import 'package:wheather_app/view_model/wheather_view_model.dart';

import '../model/wheather_model.dart';
import '../resources/components/app_urls.dart';

class WheatherApiRepo{

 BaseApiService wheatherApi =NetworkApiService();

 Future<WeatherModel>fetchWeather() async{
  try{
   dynamic response =await wheatherApi.getGetApiResponse(AppUrl.wheatherApiEndPoint);
   return response=WeatherModel.fromJson(response);
  }
  catch(e){
   throw e;
  }
 }
}