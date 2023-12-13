import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/base_equatable.dart';
import '../../utils/preference_helpher.dart';


part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationUnInitialized());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event ) async* {
   if (event is AppStarted) {
      // dynamic returnableValues = await APIRepository().dynamicRequest(
      //     HttpUrl.errorJson,
      //     method: ApiRequestMethod.get,
      //     context: event.context);
      // AidivaFlashSingleton.instance.errorMapValues =
      //     returnableValues as Map<String, dynamic>?;
      bool mpinStatus = await PreferenceHelper.getLoginDetails();
      if (mpinStatus) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnAuthenticated();
      }
    }

    if (event is LoggedOut) {
      yield AuthenticationAuthenticated();
    }
  }
}
