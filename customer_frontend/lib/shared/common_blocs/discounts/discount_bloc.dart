import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:studio_projects/models/discounts/discounttypes/code_discount.dart';
import 'package:studio_projects/models/discounts/discounttypes/link_discount.dart';
import 'package:studio_projects/shared/common_blocs/discounts/discount_event.dart';
import 'package:studio_projects/shared/common_blocs/discounts/discount_state.dart';

import '../../../models/discounts/discount.dart';
import '../../authentication/auth_service.dart';

class DiscountBloc extends Bloc<DiscountEvent, DiscountState> {
  AuthService _authService = AuthService();

  DiscountBloc(): super(DiscountInitial()) {
    on<OnRetrieveDiscountCode>((event, emit) => _retrieveDiscountCode(event));
    on<OnAddToFavoriteDiscounts>((event, emit) => _addToFavorites(event, emit));
  }

  void _retrieveDiscountCode(OnRetrieveDiscountCode event) async {
    await Future.delayed(Duration(seconds: 0));

    Discount discount = event.discount;
    emit(DiscountSuccess(discount: discount));
    emit(DiscountInitial());
  }

  void _addToFavorites(OnAddToFavoriteDiscounts event, Emitter<DiscountState> emit) {
    String userID = _authService.getUserID();

    if(state.favoriteDiscounts == null) {
      state.favoriteDiscounts = [];
    }
    state.favoriteDiscounts!.add(event.discount);

    print(state.favoriteDiscounts);

    emit(DiscountAddedToFavoritesSuccess());
    emit(DiscountInitial());
  }

  // @override
  // DiscountState? fromJson(Map<String, dynamic> json) {
  //   return DiscountState(favoriteDiscounts: json['favorites']);
  // }
  //
  // @override
  // Map<String, dynamic>? toJson(DiscountState state) {
  //   return {'favorites': state.favoriteDiscounts};
  // }
}