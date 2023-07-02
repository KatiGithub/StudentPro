import 'package:equatable/equatable.dart';
import 'package:studio_projects/models/retailers/business.dart';

abstract class FavoriteEvent extends Equatable {
  Business business;

  FavoriteEvent({required this.business});

  @override
  List<Object> get props => [];
}

class OnAddToFavorite extends FavoriteEvent{
  OnAddToFavorite({required super.business});
}

class OnRemoveFromFavorite extends FavoriteEvent {
  OnRemoveFromFavorite({required super.business});
}

class OnIsFavorite extends FavoriteEvent {
  OnIsFavorite({required super.business});
}

class OnRetrieveFavorites extends FavoriteEvent {
  OnRetrieveFavorites({required super.business});
}

