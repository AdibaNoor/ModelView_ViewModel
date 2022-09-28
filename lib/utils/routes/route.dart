

import 'package:flutter/material.dart';
import 'package:mvvm_app/utils/routes/routes_names.dart';
import 'package:mvvm_app/view/home_view.dart';

import '../../view/login_view.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings setting){
    switch(setting.name){
      case RouteNames.home:
        return MaterialPageRoute(builder: (context)=> const HomeView());
      case RouteNames.login:
        return MaterialPageRoute(builder: (context)=> const LoginView());
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