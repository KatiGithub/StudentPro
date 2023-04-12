import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/shared/common_blocs/university/university_event.dart';
import 'package:studio_projects/shared/common_blocs/university/university_state.dart';
import 'package:studio_projects/shared/utils/university.dart';

import '../../../models/university.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  UniversityBloc(): super(UniversityStateInitial()) {
    on<OnGetUniversities>((event, emit) => _OnGetUniversities(event, emit));
  }

  void _OnGetUniversities(OnGetUniversities event, Emitter<UniversityState> emit) async  {
    await getUniversities().then((List<University> value) {
      emit(
        UniversityStateRetrieveSuccessful(listUniversities: value)
      );
    });
  }
}