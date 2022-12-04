import 'package:flutter/material.dart';
import 'package:mvvm_app/utils/routes/routes_names.dart';
import 'package:mvvm_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final _userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        elevation:0,
        backgroundColor: Colors.amber,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Home',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(width: 170,),
            InkWell(
                onTap: (){
                  _userPreference.remove().then((value){
                    Navigator.pushNamed(context, RouteNames.login);
                  });
                },
                child: Text("Logout",style: TextStyle(color: Colors.red,fontSize: 15))),
          ],
        ),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        ],
      ),
    );
  }
}
