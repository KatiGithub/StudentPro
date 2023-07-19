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

  void searchByQuery(String query) async {
    emit(SearchLoading());

    await searchService.searchByQuery(query).then((List<Business> businesses) {
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

  void searchByCategory(int categoryId) {
    emit(SearchLoading());
    searchService.searchByCategory(categoryId).then((List<Business> businesses) {
      searchResults = businesses;
      emit(SearchSuccess());
    });
  }

  Future<void> getSearchHistory() async {
    searchHistory.clear();

    return await searchService.getSearchHistory().then((List<Business> businesses) {
      this.searchHistory = businesses;
    });
  }

  void clearSearchResult() {
    searchResults.clear();
    emit(SearchInitial());
  }
}
