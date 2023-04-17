import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:studio_projects/shared/common_blocs/theme/theme_event.dart';
import 'package:studio_projects/shared/common_blocs/theme/theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc(): super(ThemeInitial());

  @override
  ThemeState? fromJson(Object json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}