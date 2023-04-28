import 'package:equatable/equatable.dart';
import 'package:studio_projects/models/retailers/retailer.dart';

import '../../models/discounts/discount.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  List<Retailer> retailerSearchResults;

  SearchSuccess({required this.retailerSearchResults});

  @override
  List<Object> get props => [retailerSearchResults];
}