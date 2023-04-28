import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_event.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_state.dart';

import '../../../models/retailers/retailer.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  List<Retailer> retailers = [];

  FavoriteBloc(): super(FavoriteInitial()) {
    on<OnAddToFavorite>((event, emit) => _onAddToFavorite(event, emit));
    on<OnRemoveFromFavorite>((event, emit) => _onRemoveFromFavorite(event, emit));
    on<OnIsFavorite>((event, emit) => _onIsFavorite(event, emit));
    on<OnRetrieveFavorites>((event, emit) => _onRetrieveFavorites(event, emit));
  }

  void _onAddToFavorite(OnAddToFavorite event, Emitter<FavoriteState> emit) {
    retailers.add(event.retailer);

    emit(FavoriteAddedSuccess());
    emit(FavoriteInitial());
  }

  void _onRemoveFromFavorite(OnRemoveFromFavorite event, Emitter<FavoriteState> emit) {
    retailers.remove(event.retailer);

    emit(FavoriteRemovedSuccess());
    emit(FavoriteInitial());
  }

  void _onIsFavorite(OnIsFavorite event, Emitter<FavoriteState> emit) {
    emit(FavoriteIsFavorite(isFavorite: retailers.contains(event.retailer)));
    emit(FavoriteInitial());
  }

  void _onRetrieveFavorites(OnRetrieveFavorites event, Emitter<FavoriteState> emit) {
    emit(FavoriteRetrievedSuccess(favoriteRetailers: retailers));
    emit(FavoriteInitial());
  }
}