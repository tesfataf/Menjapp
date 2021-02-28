import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menjapp/src/blocs/request_event.dart';
import 'package:menjapp/src/blocs/request_state.dart';
import 'package:menjapp/src/blocs/user_event.dart';
import 'package:menjapp/src/blocs/user_state.dart';
import 'package:menjapp/src/repository/request_repository.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState>{
  final RequestRepository requestRepository;

  RequestBloc({@required this.requestRepository})
  : assert(requestRepository != null), super(RequestLoading());

  @override
  Stream<RequestState> mapEventToState(RequestEvent event) async* {
    if(event is RequestLoad){
      yield RequestLoading();

      try{
        final requests = await requestRepository.getRequests();
        yield RequestLoadSuccess(requests);
      }catch (_){
        yield RequestOperationFailure();
      }
    }

    if(event is RequestCreate){
      try{
      await requestRepository.createRequest(event.request);
      final requests = await requestRepository.getRequests();
      yield RequestLoadSuccess(requests);
      }catch (_){
        yield RequestOperationFailure();
      }
    }

    if (event is RequestApprove){
      try{
        await requestRepository.approveRequest(event.request);
        final requests = await requestRepository.getRequests();
        yield RequestLoadSuccess(requests);
      }catch (_){
        yield RequestOperationFailure();
      }


    }

    if(event is RequestDisApprove){
      try{
        await requestRepository.disapproveRequest(event.request.id);
        final requests = await requestRepository.getRequests();
        yield RequestLoadSuccess(requests);

      }catch (_){
        yield RequestOperationFailure();
      }
    }

    }
  }

