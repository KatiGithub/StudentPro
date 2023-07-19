import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/shared/service/favorite_service.dart';
import 'package:studio_projects/views/main/favorite/favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  List<Business> favoriteBusinesses = [];
  FavoriteService favoriteService = FavoriteService();

  FavoriteCubit(): super(FavoriteInitial());

  void getFavoriteBusinesses() {
    emit(FavoriteLoading());

    favoriteService.getFavoriteRetailers().then((List<Business> businesses) {
      favoriteBusinesses = businesses;
      emit(FavoriteSuccess());
    });

  }

  Future<bool> checkFavoriteRetailer(int businessId) async {
    return await favoriteService.checkFavoriteRetailer(businessId);
  }

  Future<void> favoritePress(int businessId) async {
    try {
      return await favoriteService.favoritePress(businessId);
    } catch (e) {
      emit(FavoriteError(e.toString()));
    } finally {
      emit(FavoriteInitial());
    }
  }
}