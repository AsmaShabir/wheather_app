


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../view_model/services/splash_services.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
   splashServices SplashServices= splashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     SplashServices.SplashScreen(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF676BD0),
        body: Center(
          // child: Text("splash Screen",style: Theme.of(context).textTheme.headlineMedium,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/partlycloudy.png',height: 200,),
            SizedBox(height: 10,),
             Text("Weather",style: GoogleFonts.poppins(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
            
          ],
        ),
        
        )
            
    );
  }
}
