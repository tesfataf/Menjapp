import 'package:equatable/equatable.dart';
import 'package:menjapp/src/models/request_model.dart';

abstract class RequestEvent extends Equatable{
  const RequestEvent();
}

class RequestLoad extends RequestEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}

class RequestCreate extends RequestEvent{
  final RequestModel request;
  RequestCreate(this.request);

  @override
  // TODO: implement props
  List<Object> get props => [request];

    @override
  String toString() => 'Request Created {request: $request}';

}

class RequestApprove extends RequestEvent{
  final RequestModel request;
  const RequestApprove(this.request);

  @override
  // TODO: implement props
  List<Object> get props => [request];

    @override
  String toString() => 'Request approved {request: $request}';
}

class RequestDisApprove extends RequestEvent{
  final RequestModel request;
  const RequestDisApprove(this.request);

  @override
  // TODO: implement props
  List<Object> get props => [request];
  @override
  String toString() => 'Request DisApproved { request: $request}';
}