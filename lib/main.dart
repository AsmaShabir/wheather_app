import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheather_app/model/user_model.dart';
import 'package:wheather_app/utils/routes/routes.dart';
import 'package:wheather_app/utils/routes/routes_name.dart';
import 'package:wheather_app/view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>UserViewModel())
    ],
      
      
    child:   MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    initialRoute: routesName.splash,
      onGenerateRoute: routes.generateRoute,
    ));
  }
}


