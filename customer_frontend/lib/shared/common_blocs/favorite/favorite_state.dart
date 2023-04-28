import 'package:equatable/equatable.dart';

import '../../../models/retailers/retailer.dart';

abstract class FavoriteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteAddedSuccess extends FavoriteState {}

class FavoriteRemovedSuccess extends FavoriteState {}

class FavoriteIsFavorite extends FavoriteState {
  bool isFavorite;
  FavoriteIsFavorite({required this.isFavorite});

  @override
  List<Object> get props => [isFavorite];
}

class FavoriteRetrievedSuccess extends FavoriteState {
  List<Retailer> favoriteRetailers;
  FavoriteRetrievedSuccess({required this.favoriteRetailers});

  List<Object> get props => [favoriteRetailers];
}