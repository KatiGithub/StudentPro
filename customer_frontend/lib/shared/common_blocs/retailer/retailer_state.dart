import 'package:equatable/equatable.dart';
import 'package:studio_projects/models/retailers/business.dart';

abstract class RetailerState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RetailerInitial extends RetailerState {}

class RetailerLoading extends RetailerState {}

class RetailerLoadComplete extends RetailerState {
  Business retailer;

  RetailerLoadComplete({required this.retailer});

  @override
  List<Object> get props => [retailer];
}