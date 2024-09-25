

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../model/user_model.dart';
import '../../utils/routes/routes_name.dart';
import '../user_view_model.dart';


class splashServices{

  Future<userModel>getUserData()=>UserViewModel().getUser();
 void SplashScreen(BuildContext context)async{
   await Future.delayed(Duration(seconds: 3));
   Navigator.pushNamed(context, routesName.home)

   .onError((error,stackTrace){

  if(kDebugMode){
  print(error.toString());
  }
  });
 }

  // void checkAuthentication(BuildContext context) {
  //   getUserData().then((value) async {
  //     if(value.token=='null'||value.token==""){
  //       await Future.delayed(Duration(seconds: 3));
  //       Navigator.pushNamed(context, routesName.login);
  //     }
  //     else{
  //       await Future.delayed(Duration(seconds: 3));
  //       Navigator.pushNamed(context, routesName.home);
  //
  //     }
  //   }).onError((error,stackTrace){
  //
  //     if(kDebugMode){
  //       print(error.toString());
  //     }
  //   });
  // }
}