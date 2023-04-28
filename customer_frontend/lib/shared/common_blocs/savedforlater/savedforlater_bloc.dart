import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/shared/common_blocs/savedforlater/savedforlater_event.dart';
import 'package:studio_projects/shared/common_blocs/savedforlater/savedforlater_state.dart';


import '../../../models/discounts/discount.dart';

class SavedForLaterBloc extends Bloc<SavedForLaterEvent, SavedForLaterState> {
  List<Discount> _favoriteDiscounts = [];

  SavedForLaterBloc(): super(SavedForLaterInitial()) {
    on<OnAddToSavedForLater>((event, emit) => _addToFavorites(event, emit));
    on<OnRemoveFromSavedForLater>((event, emit) => _removeFromFavorites(event, emit));
    on<OnIsSavedForLater>((event, emit) => _isFavorite(event, emit));
  }

  List<Discount> get favoriteDiscounts => _favoriteDiscounts;

  void _addToFavorites(OnAddToSavedForLater event, Emitter<SavedForLaterState> emit) async {
    _favoriteDiscounts.add(event.discount);

    emit(SavedForLaterAddedSuccess());
    print(_favoriteDiscounts);
    emit(SavedForLaterInitial());
  }

  void _removeFromFavorites(OnRemoveFromSavedForLater event, Emitter<SavedForLaterState> emit) async {
    _favoriteDiscounts.remove(event.discount);
    emit(SavedForLaterRemovedSuccess());
    print(_favoriteDiscounts);
    emit(SavedForLaterInitial());
  }

  void _isFavorite(OnIsSavedForLater event, Emitter<SavedForLaterState> emit) {
    emit(SavedForLaterIsSavedForLater(isSavedForLater: _favoriteDiscounts.contains(event.discount)));
    emit(SavedForLaterInitial());
  }

  void _retrieveFavorites(FavoriteEvent, event, Emitter<SavedForLaterState> emit){
    emit(SavedForLaterRetrieveSuccess(favoriteDiscounts: _favoriteDiscounts));
    emit(SavedForLaterInitial());
  }
}