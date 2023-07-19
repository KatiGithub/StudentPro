import 'package:equatable/equatable.dart';

class FavoriteState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteError extends FavoriteState {
  String error;

  FavoriteError(this.error);
}

class FavoriteSuccess extends FavoriteState {}