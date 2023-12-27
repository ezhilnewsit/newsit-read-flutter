
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import 'welcome_lang_event.dart';

class WelcomeLangBloc extends Bloc<WelcomeLangEvent, BaseState> {
  WelcomeLangBloc() : super(InitialState());


  @override
  Stream<BaseState> mapEventToState(
      WelcomeLangEvent event,
      ) async* {
    if (event is WelcomeLangInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}