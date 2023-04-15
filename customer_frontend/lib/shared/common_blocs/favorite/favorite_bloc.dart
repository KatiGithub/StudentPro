import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_event.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_state.dart';

import '../../../models/discounts/discount.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  List<Discount> _favoriteDiscounts = [];

  FavoriteBloc(): super(FavoriteInitial()) {
    on<OnAddToFavorites>((event, emit) => _addToFavorites(event, emit));
    on<OnRemoveFromFavorites>((event, emit) => _removeFromFavorites(event, emit));
    on<OnIsFavorite>((event, emit) => _isFavorite(event, emit));
  }

  List<Discount> get favoriteDiscounts => _favoriteDiscounts;

  void _addToFavorites(OnAddToFavorites event, Emitter<FavoriteState> emit) async {
    _favoriteDiscounts.add(event.discount);

    emit(FavoriteAddedSuccess());
    print(_favoriteDiscounts);
    emit(FavoriteInitial());
  }

  void _removeFromFavorites(OnRemoveFromFavorites event, Emitter<FavoriteState> emit) async {
    _favoriteDiscounts.remove(event.discount);
    emit(FavoriteRemovedSuccess());
    print(_favoriteDiscounts);
    emit(FavoriteInitial());
  }

  void _isFavorite(OnIsFavorite event, Emitter<FavoriteState> emit) {
    emit(FavoriteIsFavorite(isFavorite: _favoriteDiscounts.contains(event.discount)));
    emit(FavoriteInitial());
  }

  void _retrieveFavorites(FavoriteEvent, event, Emitter<FavoriteState> emit){
    emit(FavoriteRetrieveSuccess(favoriteDiscounts: _favoriteDiscounts));
    emit(FavoriteInitial());
  }
}