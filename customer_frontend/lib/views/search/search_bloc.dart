import 'package:flutter_bloc/flutter_bloc.dart';
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
    await Future.delayed(Duration(seconds: 3));

    emit(SearchSuccess(discountSearchResults: _getResults(event.searchQuery)));
    emit(SearchInitial());
  }

  List<Discount> _getResults(String searchQuery) {
    List<Discount> discounts = [];

    for (int i = 0; i < 6; i++) {
      discounts.add(new CodeDiscount(
          discountID: i + 200.toDouble(),
          discountImage: 'assets/food_test.jpg',
          discountDescription: "Test Description",
          discountTitle: 'Promotion',
          couponCode: "XXXX-XXXXX-XXXX"));
    }

    for (int i = 0; i < 6; i++) {
      discounts.add(new LinkDiscount(
          discountID: i + 19.toDouble(),
          discountImage: 'assets/food_test.jpg',
          discountDescription: "Test Description",
          discountTitle: 'Promotion',
          linkRedirect: "https://lin.ee/eHlcWLN"));
    }

    return discounts;
  }
}
