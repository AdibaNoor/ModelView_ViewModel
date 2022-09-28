

import 'package:flutter/material.dart';
import 'package:mvvm_app/utils/routes/routes_names.dart';
import 'package:mvvm_app/view/home_screen.dart';

import '../../view/login_screen.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings setting){
    switch(setting.name){
      case RouteNames.home:
        return MaterialPageRoute(builder: (context)=> const HomeScreen());
      case RouteNames.login:
        return MaterialPageRoute(builder: (context)=> const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No route Defined'),
            ),
          );
        });
    }
  }
}