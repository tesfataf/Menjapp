import 'package:equatable/equatable.dart';


class RequestModel extends Equatable{
  int id;
  int studentId;
  int plateNumber;
  DateTime date;
  bool approved;

  RequestModel({this.id, this.studentId, this.plateNumber, this.date, this.approved});





  @override
  // TODO: implement props
  List<Object> get props => [id,studentId,plateNumber,date];

  factory RequestModel.fromJson(Map<String, dynamic> json){
    return RequestModel(
      id: json['id'],
      studentId: json['studentid'],
      plateNumber: json['platenumber'],
      date: json['date'],
      approved: json['approved']
    );

  }

  @override
  String toString() => 'Request {id: $id, studentid: $studentId, platenumber: $plateNumber, date: $date }';
  
  }