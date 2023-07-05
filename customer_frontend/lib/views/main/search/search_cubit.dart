import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/shared/service/search_service.dart';
import 'package:studio_projects/views/main/search/search_event.dart';
import 'package:studio_projects/views/main/search/search_state.dart';


class SearchCubit extends Cubit<SearchState> {

  List<Business> searchResults = [];
  List<Business> searchHistory = [];

  final SearchService searchService = SearchService();

  SearchCubit(): super(SearchInitial());

  List<Business> _getResults(String searchQuery) {
    List<Business> retailers = [];

    return retailers;
  }

  void searchByQuery(String query) {
    emit(SearchLoading());

    searchService.searchByQuery(query).then((List<Business> businesses) {
      searchResults = businesses;
      emit(SearchSuccess());
    });
  }

  void searchByLocation(double longitude, double latitude) {
    emit(SearchLoading());

    searchService.searchByLocation(longitude, latitude).then((List<Business> businesses) {
      searchResults = businesses;
      emit(SearchSuccess());
    });
  }

  void getSearchHistory() {
    searchHistory.clear();
  }

  void clearSearchResult() {
    searchResults.clear();
    emit(SearchInitial());
  }
}
