import 'package:equatable/equatable.dart';
import 'package:studio_projects/models/retailers/business.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  List<Business> retailerSearchResults;

  SearchSuccess({required this.retailerSearchResults});

  @override
  List<Object> get props => [retailerSearchResults];
}