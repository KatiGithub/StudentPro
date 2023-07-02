import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/views/search/search_event.dart';
import 'package:studio_projects/views/search/search_state.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<OnSearchRequestComplete>(
        (event, emit) => _OnSearchRequestComplete(event, emit));
  }

  void _OnSearchRequestComplete(
      OnSearchRequestComplete event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    await Future.delayed(Duration(seconds: 0));

    emit(SearchSuccess(retailerSearchResults: _getResults(event.searchQuery)));
    emit(SearchInitial());
  }

  List<Business> _getResults(String searchQuery) {
    List<Business> retailers = [];

    return retailers;

  }
}
