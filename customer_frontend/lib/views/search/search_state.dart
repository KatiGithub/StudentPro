import 'package:equatable/equatable.dart';

import '../../models/discounts/discount.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  List<Discount> discountSearchResults;

  SearchSuccess({required this.discountSearchResults});

  @override
  List<Object> get props => [discountSearchResults];
}