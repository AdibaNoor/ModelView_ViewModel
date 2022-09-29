

import 'package:flutter/material.dart';
import 'package:mvvm_app/utils/routes/routes_names.dart';
import 'package:mvvm_app/view/home_view.dart';
import 'package:mvvm_app/view/signup_view.dart';
import 'package:mvvm_app/view/splash_view.dart';

import '../../view/login_view.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings setting){
    switch(setting.name){
      case RouteNames.splash:
        return MaterialPageRoute(builder: (context)=> const SplashView());
      case RouteNames.home:
        return MaterialPageRoute(builder: (context)=> const HomeView());
      case RouteNames.login:
        return MaterialPageRoute(builder: (context)=> const LoginView());
      case RouteNames.signUp:
        return MaterialPageRoute(builder: (context)=> const SignUpView());
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