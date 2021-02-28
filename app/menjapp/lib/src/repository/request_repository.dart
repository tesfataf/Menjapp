import 'package:flutter/cupertino.dart';
import 'package:menjapp/src/data_Provider/request_data.dart';
import 'package:menjapp/src/models/request_model.dart';

class RequestRepository{


  final RequestDataProvider dataProvider;
  RequestRepository({@required this.dataProvider})
      :assert(dataProvider != null);

  Future<void> createRequest(RequestModel request) async{
    return await dataProvider.createRequest(request);
  }

  Future<List<RequestModel>> getRequests() async {
    return await dataProvider.getRequests();
  }

  Future<void> approveRequest(RequestModel request) async{
    return await dataProvider.approveRequest(request);
  }

  Future<void> disapproveRequest(int id) async{
    return await dataProvider.disApproveRequest(id);
  }

}