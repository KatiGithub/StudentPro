import 'package:equatable/equatable.dart';

import '../../../models/discounts/discount.dart';

abstract class HomeState extends Equatable {

  HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {}

class HomeError extends HomeState {}

class HomeSuccess extends HomeState {}

