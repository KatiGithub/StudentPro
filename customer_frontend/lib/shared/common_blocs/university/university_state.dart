import 'package:equatable/equatable.dart';

import '../../../models/university.dart';

abstract class UniversityState extends Equatable {

  @override
  List<Object?> get props => [];
}
class UniversityStateInitial extends UniversityState {}

class UniversityStateRetrieve extends UniversityState {}

class UniversityStateRetrieveSuccessful extends UniversityState {
  List<University> listUniversities = <University>[];

  UniversityStateRetrieveSuccessful({
    required this.listUniversities
  });

  List<Object> get props => [this.listUniversities];
}