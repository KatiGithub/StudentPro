import 'package:equatable/equatable.dart';

import '../../../models/discounts/discount.dart';

abstract class HomeState extends Equatable {
  List<Discount> discounts;

  HomeState(): this.discounts = [];

  @override
  List<Object> get props => throw UnimplementedError();
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {}

