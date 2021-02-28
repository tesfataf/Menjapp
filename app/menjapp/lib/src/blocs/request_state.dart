import 'package:equatable/equatable.dart';
import 'package:menjapp/src/models/request_model.dart';

class RequestState extends Equatable{
  const RequestState();

  @override
  // TODO: implement props
  List<Object> get props => [];
  
}

class RequestLoading extends RequestState{}

class RequestLoadSuccess extends RequestState{
  final List<RequestModel> requests;

  RequestLoadSuccess([this.requests = const []]);

  @override
  // TODO: implement props
  List<Object> get props => [requests];

}

class RequestOperationFailure extends RequestState{}