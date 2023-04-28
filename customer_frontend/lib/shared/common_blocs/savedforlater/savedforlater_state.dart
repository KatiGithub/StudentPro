import 'package:equatable/equatable.dart';

import '../../../models/discounts/discount.dart';

class SavedForLaterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SavedForLaterInitial extends SavedForLaterState {}

class SavedForLaterAddedSuccess extends SavedForLaterState {}

class SavedForLaterRemovedSuccess extends SavedForLaterState {}

class SavedForLaterIsSavedForLater extends SavedForLaterState {
 bool isSavedForLater;
 SavedForLaterIsSavedForLater({required this.isSavedForLater});
}

class SavedForLaterRetrieveSuccess extends SavedForLaterState {
  List<Discount> favoriteDiscounts;
  SavedForLaterRetrieveSuccess({required this.favoriteDiscounts});
}