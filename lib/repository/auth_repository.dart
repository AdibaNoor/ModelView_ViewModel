import 'package:mvvm_app/data/network/BaseApiService.dart';
import 'package:mvvm_app/data/network/NetworkApiService.dart';
import 'package:mvvm_app/resources/app_urls.dart';

class AuthRepository{
BaseApiService _apiservice = NetworkService();

Future<dynamic> LoginApiFun(dynamic data) async{
  try{
    dynamic reponse = await _apiservice.getPostApiResponse(AppUrls.LoginApiEndpoint, data);
    return reponse;
  }catch(e){
    throw e;
  }
}
Future<dynamic> RegisterApiFun(dynamic data) async{
  try{
    dynamic reponse = await _apiservice.getPostApiResponse(AppUrls.RegisterApiEndpoint, data);
    return reponse;
  }catch(e){
    throw e;
  }
}
}