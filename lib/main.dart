import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_app/utils/routes/route.dart';
import 'package:mvvm_app/utils/routes/routes_names.dart';
import 'package:mvvm_app/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.transparent,
            statusBarColor: Colors.transparent));
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

