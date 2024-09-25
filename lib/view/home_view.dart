

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wheather_app/view_model/wheather_view_model.dart';

import '../data/response/status.dart';
import '../resources/components/colors.dart';

class homeView extends StatefulWidget {
  const homeView({super.key});

  @override
  State<homeView> createState() => _homeViewState();
}

class _homeViewState extends State<homeView> {
  WheatherViewModel wheatherViewModel =WheatherViewModel();

  @override
  void initState() {
    super.initState();
    wheatherViewModel.fetchWeatherApi();
  }
  @override
  Widget build(BuildContext context) {
     String formattedDate=DateFormat('EEEE,d,MMMM,yyyy').format(DateTime.now());
    String formattedTime=DateFormat('hh:mm:a').format(DateTime.now());
    print(DateTime.now().toString());

    return Scaffold(
      backgroundColor: Color(0xFF676BD0),
      body: ChangeNotifierProvider<WheatherViewModel>(
        create: (BuildContext context)=>wheatherViewModel,
        child: Consumer<WheatherViewModel>(builder: (context,value,_){
          switch(value.wheatherRes.status){
            case Status.LOADING:
              return CircularProgressIndicator();
            case Status.ERROR:
              return Text(value.wheatherRes.message.toString());
            case Status.COMPLETED:
            // var data=value.moviesList.data!.movies;
              return ListView.builder(

                  itemCount: value.wheatherRes.data!.weather!.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              // color: Colors.white.withOpacity(0.3),
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 40,),
                                Text(value.wheatherRes.data!.name!.toString(),style: GoogleFonts.poppins(color:AppColors.whiteColor,fontSize: 15,fontWeight: FontWeight.bold),),
                                SizedBox(height: 15,),
                                Text(value.wheatherRes.data!.sys!.country.toString(),style: GoogleFonts.poppins(color:AppColors.whiteColor,fontSize: 12,fontWeight: FontWeight.bold),),
                                SizedBox(height: 15,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.sunny,color: Colors.amber,size: 30,),

                                    SizedBox(width: 5,),
                                    Text(value.wheatherRes.data!.main!.temp.toString()+'°'+'C',style: GoogleFonts.poppins(color:AppColors.whiteColor,fontSize: 20,fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Text(value.wheatherRes.data!.weather![index].description.toString(),style: GoogleFonts.poppins(color:AppColors.whiteColor,fontSize: 20,fontWeight: FontWeight.w500)),
                                SizedBox(height: 10,),

                                Text(formattedDate.toString(),style: GoogleFonts.poppins(color:AppColors.whiteColor,fontSize: 12,fontWeight: FontWeight.w500)),
                                SizedBox(height: 10,),
                                Text(formattedTime.toString(),style: GoogleFonts.poppins(color:AppColors.whiteColor,fontSize: 12,fontWeight: FontWeight.w500)),
                                SizedBox(height: 10,),

                              ],
                            ),
                          ),

                          SizedBox(height: 15,),
                          Image.asset('assets/images/partlycloudy.png',height: 200,),
                          SizedBox(height: 20,),
                          Container(
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [

                                     Column(
                                       children: [
                                         Icon(Icons.wind_power,color: Colors.white,),
                                         SizedBox(height: 6,),
                                         Text(value.wheatherRes.data!.wind!.deg.toString()+'°',style: GoogleFonts.poppins(color:AppColors.whiteColor,fontSize:15,fontWeight: FontWeight.w500)),
                                         SizedBox(height: 6,),
                                         Text('Wind',style: GoogleFonts.poppins(color: Colors.white,fontSize: 10),)

                                       ],
                                     ),
                                      Column(
                                        children: [
                                          Icon(Icons.sunny,color: Colors.white,),
                                          SizedBox(height: 6,),
                                          Text(value.wheatherRes.data!.main!.tempMax.toString()+'°',style: GoogleFonts.poppins(color:AppColors.whiteColor,fontSize:15,fontWeight: FontWeight.w500)),
                                          SizedBox(height: 6,),
                                          Text('Max',style: GoogleFonts.poppins(color: Colors.white,fontSize: 10),)

                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Icon(Icons.wb_sunny,color: Colors.white,),
                                          SizedBox(height: 6,),
                                          Text(value.wheatherRes.data!.main!.tempMin.toString()+'°',style: GoogleFonts.poppins(color:AppColors.whiteColor,fontSize:15,fontWeight: FontWeight.w500)),
                                          SizedBox(height: 6,),
                                          Text('Min',style: GoogleFonts.poppins(color: Colors.white,fontSize: 10),)

                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                                    children: [
                                      Column(
                                        children: [
                                          Icon(Icons.water_drop,color: Colors.amber,),
                                          SizedBox(height: 6,),
                                          Text(value.wheatherRes.data!.main!.humidity.toString()+'km/h',style: GoogleFonts.poppins(color:AppColors.whiteColor,fontSize:15,fontWeight: FontWeight.w500)),
                                          SizedBox(height: 6,),
                                          Text('Humidity',style: GoogleFonts.poppins(color: Colors.white,fontSize: 10),)

                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Icon(Icons.air,color: Colors.amber,),
                                          SizedBox(height: 6,),
                                          Text(value.wheatherRes.data!.main!.pressure.toString()+'hPa',style: GoogleFonts.poppins(color:AppColors.whiteColor,fontSize:15,fontWeight: FontWeight.w500)),
                                          SizedBox(height: 6,),
                                          Text('Pressure',style: GoogleFonts.poppins(color: Colors.white,fontSize: 10),)

                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Icon(Icons.leaderboard,color: Colors.amber,),
                                          SizedBox(height: 6,),
                                          Text(value.wheatherRes.data!.main!.seaLevel.toString()+'m',style: GoogleFonts.poppins(color:AppColors.whiteColor,fontSize:15,fontWeight: FontWeight.w500)),
                                          SizedBox(height: 6,),
                                          Text('Sea Level',style: GoogleFonts.poppins(color: Colors.white,fontSize: 10),)

                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),


                          // Text(value.wheatherRes.data!.weather![index].description.toString()),
                          //  Text(value.wheatherRes.data!.weather![index].id.toString()),
                          //  Text(value.wheatherRes.data!.name.toString()),
                          // Text(value.wheatherRes.data!.visibility.toString()),
                          // Text(value.wheatherRes.data!.coord!.lat.toString()),
                          // Text(value.wheatherRes.data!.main!.feelsLike.toString()),
                          // Text(value.wheatherRes.data!.main!.temp.toString()+'°'),
                          // Text(value.wheatherRes.data!.main!.humidity.toString()+'°'),
                          // Text(value.wheatherRes.data!.weather![index].icon.toString()+'°'),







                        ],
                      ),
                    );
                  }) ;
            case null:
              return Text('no data');
          }
        }),
      )
    );
  }
}
