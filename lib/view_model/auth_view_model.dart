import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_app/repository/auth_repository.dart';
import 'package:mvvm_app/utils/routes/routes_names.dart';
import 'package:mvvm_app/utils/utils.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  setloading(value){
    _loading = value;
    notifyListeners();
  }

  Future<dynamic>  LoginApi(dynamic data , BuildContext context) async{
    setloading(true);
    _myRepo.LoginApiFun(data).then((value){
      setloading(false);
      Navigator.pushNamed(context, RouteNames.home);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setloading(false);
      if(kDebugMode){
        Utils.toastMessage(error.toString());
        // print(error.toString());
      }
    } );
  }
}