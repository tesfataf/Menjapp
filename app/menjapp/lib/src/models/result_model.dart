import 'package:equatable/equatable.dart';


class ResultModel extends Equatable{
  int id;
  int studentId;
  int test1;
  int test2;
  int test3;
  int test4;

  ResultModel({this.id, this.studentId, this.test1, this.test2, this.test3, this.test4});





  @override
  // TODO: implement props
  List<Object> get props => [id,studentId,test1,test2,test3,test4];

  factory ResultModel.fromJson(Map<String, dynamic> json){
    return ResultModel(
      id: json['id'],
      studentId: json['studentid'],
      test1: json['test1'],
      test2: json['test2'],
      test3: json['test3'],
      test4: json['test4'],
    );

  }

  @override
  String toString() => 'Request {id: $id, studentid: $studentId, test1: $test1, test2: $test2, test3: $test3, test4: $test4 }';
  
  }