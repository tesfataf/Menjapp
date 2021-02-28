import 'package:flutter/cupertino.dart';
import 'package:menjapp/src/data_Provider/result_data.dart';
import 'package:menjapp/src/models/result_model.dart';

class ResultRepository{


  final ResultDataProvider dataProvider;
  ResultRepository({@required this.dataProvider})
      :assert(dataProvider != null);

  Future<void> giveResult(ResultModel result) async{
    return await dataProvider.giveResult(result);
  }



  Future<ResultModel> getResult(int id) async{
    return await dataProvider.getResult(id);
  }

}