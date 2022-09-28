import 'dart:convert';
import 'dart:io';

import 'package:flutter/scheduler.dart';
import 'package:http/http.dart';
import 'package:mvvm_app/data/app_exceptions.dart';
import 'package:mvvm_app/data/network/BaseApiService.dart';
import 'package:http/http.dart' as http;

class NetworkService extends BaseApiService{
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data)  async{
    dynamic responseJson;
    try{
      Response response = await post(
        Uri.parse(url),
        body: data
      ).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet');
    }
    return responseJson;
  }
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server, with status code'
                +response.statusCode.toString());
    }
  }

}