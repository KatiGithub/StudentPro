import 'package:equatable/equatable.dart';
import 'package:studio_projects/models/discounts/discount.dart';

abstract class SavedForLaterEvent extends Equatable {
  Discount discount;
  SavedForLaterEvent({required this.discount});

  @override
  List<Object?> get props => [];
}

class OnAddToSavedForLater extends SavedForLaterEvent {
  OnAddToSavedForLater({required super.discount});
}

class OnRemoveFromSavedForLater extends SavedForLaterEvent {
  OnRemoveFromSavedForLater({required super.discount});

}

class OnIsSavedForLater extends SavedForLaterEvent {
  OnIsSavedForLater({required super.discount});
}

class OnRetrieveSavedForLater extends SavedForLaterEvent {
  OnRetrieveSavedForLater({required super.discount});
}