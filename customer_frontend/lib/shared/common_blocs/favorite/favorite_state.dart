import 'package:equatable/equatable.dart';

import '../../../models/discounts/discount.dart';

class FavoriteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteAddedSuccess extends FavoriteState {}

class FavoriteRemovedSuccess extends FavoriteState {}

class FavoriteIsFavorite extends FavoriteState {
 bool isFavorite;
 FavoriteIsFavorite({required this.isFavorite});
}

class FavoriteRetrieveSuccess extends FavoriteState {
  List<Discount> favoriteDiscounts;
  FavoriteRetrieveSuccess({required this.favoriteDiscounts});
}