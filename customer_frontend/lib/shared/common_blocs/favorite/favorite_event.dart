import 'package:equatable/equatable.dart';
import 'package:studio_projects/models/retailers/retailer.dart';

abstract class FavoriteEvent extends Equatable {
  Retailer retailer;

  FavoriteEvent({required this.retailer});

  @override
  List<Object> get props => [];
}

class OnAddToFavorite extends FavoriteEvent{
  OnAddToFavorite({required super.retailer});
}

class OnRemoveFromFavorite extends FavoriteEvent {
  OnRemoveFromFavorite({required super.retailer});
}

class OnIsFavorite extends FavoriteEvent {
  OnIsFavorite({required super.retailer});
}

class OnRetrieveFavorites extends FavoriteEvent {
  OnRetrieveFavorites({required super.retailer});
}

