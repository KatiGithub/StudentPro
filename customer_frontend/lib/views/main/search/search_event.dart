import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnSearchRequestComplete extends SearchEvent {
  String searchQuery;

  OnSearchRequestComplete({required this.searchQuery});
  List<Object> get props => [searchQuery];
}

