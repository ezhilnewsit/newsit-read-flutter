import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:newsit_read/screens/theme/theme_events.dart';
import 'package:newsit_read/screens/theme/theme_state.dart';

import '../../utils/app_themes copy.dart';


class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super( ThemeState(
    themeData: AppThemes.appThemeData[AppTheme.darkTheme],
  ),);

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeEvent) {
      yield ThemeState(
        themeData: AppThemes.appThemeData[event.appTheme],

      );
    }
  }
}
