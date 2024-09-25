

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wheather_app/utils/routes/routes_name.dart';
import 'package:wheather_app/view/home_view.dart';

import '../../view/splash_view.dart';



class routes{
  static Route<dynamic>generateRoute(RouteSettings settings){

    switch(settings.name){
      case routesName.splash:
        return MaterialPageRoute(builder: (BuildContext context)=>SplashView());
      case routesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=>homeView());

      // case routesName.view:
      //   final arg=settings.arguments as thisViewModel;
      //   return MaterialPageRoute(builder: (BuildContext context)=>Thisview(viewModel:arg));
      // case routesName.login:
      //   return MaterialPageRoute(builder: (BuildContext context)=>loginView());
      // case routesName.signup:
      //   return MaterialPageRoute(builder: (BuildContext context)=>signUpView());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }


  }
}