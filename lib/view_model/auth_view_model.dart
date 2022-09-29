import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_app/model/user_model.dart';
import 'package:mvvm_app/repository/auth_repository.dart';
import 'package:mvvm_app/utils/routes/routes_names.dart';
import 'package:mvvm_app/utils/utils.dart';
import 'package:mvvm_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signupLoading => _signUpLoading;

  setloading(value){
    _loading = value;
    notifyListeners();
  }
  setSignUploading(value){
    _signUpLoading= value;
    notifyListeners();
  }

  Future<dynamic>  LoginApi(dynamic data , BuildContext context) async{
    setloading(true);
    _myRepo.LoginApiFun(data).then((value){
      setloading(false);
      final _userPreferences = Provider.of<UserViewModel>(context, listen: false);
      _userPreferences.saveUser(UserModel(
        token: value['token'].toString()
      ));
      Navigator.pushNamed(context, RouteNames.home);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setloading(false);
      if(kDebugMode){
        // Utils.toastMessage(error.toString());
        print(error.toString());
      }
    } );
  }

  Future<dynamic>  RegisterApi(dynamic data , BuildContext context) async{
    setSignUploading(true);
    _myRepo.RegisterApiFun(data).then((value){
      setSignUploading(false);
      Navigator.pushNamed(context, RouteNames.home);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUploading(false);
      if(kDebugMode){
        Utils.toastMessage(error.toString());
        // print(error.toString());
      }
    } );
  }
}