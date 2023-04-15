import 'package:equatable/equatable.dart';
import 'package:studio_projects/models/discounts/discount.dart';

abstract class FavoriteEvent extends Equatable {
  Discount discount;
  FavoriteEvent({required this.discount});

  @override
  List<Object?> get props => [];
}

class OnAddToFavorites extends FavoriteEvent {
  OnAddToFavorites({required super.discount});
}

class OnRemoveFromFavorites extends FavoriteEvent {
  OnRemoveFromFavorites({required super.discount});

}

class OnIsFavorite extends FavoriteEvent {
  OnIsFavorite({required super.discount});
}

class OnRetrieveFavorites extends FavoriteEvent {
  OnRetrieveFavorites({required super.discount});
}