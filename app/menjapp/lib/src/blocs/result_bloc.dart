import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menjapp/src/blocs/result_event.dart';
import 'package:menjapp/src/blocs/result_state.dart';
import 'package:menjapp/src/repository/result_repository.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState>{
  final ResultRepository resultRepository;

  ResultBloc({@required this.resultRepository})
  : assert(resultRepository != null), super(ResultLoading());

  @override
  Stream<ResultState> mapEventToState(ResultEvent event) async* {
    if(event is ResultLoad){
      yield ResultLoading();

      try{
        final result = await resultRepository.getResult(event.result.id);
        yield ResultLoadSuccess(result);
      }catch (_){
        yield ResultOperationFailure();
      }
    }

    if(event is ResultCreate){
      try{
      await resultRepository.giveResult(event.result);
      final result = await resultRepository.getResult(event.result.id);
      yield ResultLoadSuccess(result);
      }catch (_){
        yield ResultOperationFailure();
      }
    }

   

    }
  }

