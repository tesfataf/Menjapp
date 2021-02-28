import 'dart:async';
import 'dart:async';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:menjapp/src/models/result_model.dart';

class ResultDataProvider{
  final _baseUrl = 'http://192.168.43.42:8181';
  final http.Client httpClient;

  ResultDataProvider({@required this.httpClient}) :assert(httpClient != null);

  Future<void>  giveResult(ResultModel result) async{
    final response = await httpClient.post('$_baseUrl/results',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      
      },
      body: jsonEncode(<String, dynamic>{
        'id': result.id,
        'studentid': result.studentId,
        'test1': result.test1,
        'test2': result.test2,
        'test3': result.test3,
        'test4': result.test4,
      })
    
    );

    if(response.statusCode != 201){
      throw Exception('faild to give result');
    }
    
  }

  Future<ResultModel> getResult(int id) async{
    final response = await httpClient.get('$_baseUrl/results/${id.toString()}');

    if (response.statusCode == 200){
      final result = jsonDecode(response.body);
      return ResultModel.fromJson(result);
    }
  }


}