import 'package:equatable/equatable.dart';

class University extends Equatable {
  double? universityId;
  String? name;
  String? country;

  University({
    required this.universityId,
    required this.name,
    required this.country
  });

  @override
  String toString() {
    return name!;
  }

  @override
  List<Object?> get props => [universityId];
}