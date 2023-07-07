import 'package:equatable/equatable.dart';
import 'package:studio_projects/models/retailers/business.dart';

abstract class RetailerState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RetailerInitial extends RetailerState {}

class RetailerLoading extends RetailerState {}

class RetailerError extends RetailerState {
  String errorCode;

  RetailerError(this.errorCode);
}

class RetailerSuccess extends RetailerState {}