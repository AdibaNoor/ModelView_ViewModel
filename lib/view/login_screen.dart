import 'package:flutter/material.dart';
import 'package:mvvm_app/utils/routes/routes_names.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: InkWell(
          onTap: (){
            Navigator.pushNamed(context, RouteNames.home);
          },
          child: Text("Click"),
        ),
      ),
    );
  }
}
