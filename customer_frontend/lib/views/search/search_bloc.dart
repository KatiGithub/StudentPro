import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/models/retailers/retailer.dart';
import 'package:studio_projects/views/search/search_event.dart';
import 'package:studio_projects/views/search/search_state.dart';

import '../../models/discounts/discount.dart';
import '../../models/discounts/discounttypes/codeDiscounts.dart';
import '../../models/discounts/discounttypes/linkDiscounts.dart';

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

  List<Retailer> _getResults(String searchQuery) {
    List<Retailer> retailers = [];

    for(int i = 0; i < 20; i++) {
      retailers.add(
        Retailer(
          RetailerID: i.toDouble(),
          RetailerName: "Example Name"
        )
      );
    }

    return retailers;

  }
}
