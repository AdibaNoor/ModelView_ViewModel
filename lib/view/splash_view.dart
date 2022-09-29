import 'package:flutter/material.dart';
import 'package:mvvm_app/view_model/services/user_view_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices  _splashService = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashService.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text('Splash Screen')),
    );
  }
}
