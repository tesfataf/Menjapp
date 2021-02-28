import 'dart:async';
import 'dart:async';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:menjapp/src/models/request_model.dart';

class RequestDataProvider{
  final _baseUrl = 'http://192.168.43.42:8181';
  final http.Client httpClient;

  RequestDataProvider({@required this.httpClient}) :assert(httpClient != null);

  Future<void> createRequest(RequestModel request) async{
    final response = await httpClient.post('$_baseUrl/requests',
        headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      
      },

      body: jsonEncode(<String, dynamic>{
        'studentid' : request.studentId,
        'platenumber': request.plateNumber,
        'date': request.date,
        

      }
      )
    
    );

        // if (response.statusCode == 201) {
      
    //   return UserModel.fromJson(jsonDecode(response.body));
    // }else
    
    if (response.statusCode != 201){
      throw Exception('Failed to create Request.');
    }
  }

    Future<List<RequestModel>> getRequests() async {
    final response = await httpClient.get('$_baseUrl/requests');
    if(response.statusCode == 200){
      final requests = jsonDecode(response.body) as List;
      //print(users); 
      return requests.map((request) => RequestModel.fromJson(request)).toList();

    }else{
      throw Exception('failed to load requests');
    }
  }



  Future<void> approveRequest(RequestModel request) async{
    final http.Response response = await httpClient.put(
      '$_baseUrl/requests/${request.id}',
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'studentid' : request.studentId,
        'platenumber': request.plateNumber,
        'date': request.date,
        'approved': request.approved,
      }),
    );
   // print(response.statusCode);
   // print(response.reasonPhrase);
    if (response.statusCode != 200) {
      throw Exception('Failed to load Request!');
    }
  } 

  Future<void> disApproveRequest(int id) async{
    final response = await httpClient.delete(
      '$_baseUrl/requests/${id.toString()}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }
    );
  

    if (response.statusCode != 204){
      throw Exception('Failed to disApprove!');
    }

  }

  




 }







