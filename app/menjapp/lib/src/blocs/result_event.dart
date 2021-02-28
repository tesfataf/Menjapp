import 'package:equatable/equatable.dart';
import 'package:menjapp/src/models/result_model.dart';

abstract class ResultEvent extends Equatable{
  const ResultEvent();
}

class ResultLoad extends ResultEvent{
  final ResultModel result;
  const ResultLoad(this.result);
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}

class ResultCreate extends ResultEvent{
  final ResultModel result;
  ResultCreate(this.result);

  @override
  // TODO: implement props
  List<Object> get props => [result];

    @override
  String toString() => 'Result Created {request: $result}';

}

