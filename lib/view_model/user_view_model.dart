

import 'package:flutter/cupertino.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class UserViewModel with ChangeNotifier{

  Future<bool>saveUser(userModel user)async{
    final SharedPreferences sp =await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  Future<userModel>getUser()async{
    final SharedPreferences sp =await SharedPreferences.getInstance();
    final String? token =sp.getString('token');

    return userModel(token:token.toString() );
  }
  Future<bool>remove()async{
    final SharedPreferences sp =await SharedPreferences.getInstance();
    sp.remove('token');
    return true;

  }
}