import 'package:equatable/equatable.dart';
import 'package:menjapp/src/models/request_model.dart';
import 'package:menjapp/src/models/result_model.dart';

class ResultState extends Equatable{
  const ResultState();

  @override
  // TODO: implement props
  List<Object> get props => [];
  
}

class ResultLoading extends ResultState{}

class ResultLoadSuccess extends ResultState{
  final ResultModel result;

  ResultLoadSuccess(this.result);

  @override
  // TODO: implement props
  List<Object> get props => [result];

}

class ResultOperationFailure extends ResultState{}