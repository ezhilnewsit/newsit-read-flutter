import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:newsit_read/screens/login_page/login_model.dart';
import 'package:newsit_read/screens/signup_page/signup_event.dart';

import '../../base/base_state.dart';
import '../../http/api_repository.dart';
import '../../http/httpurls.dart';
import '../../utils/contants.dart';
import '../../utils/singleton.dart';


class SignUpBloc extends Bloc<SignUpEvent, BaseState> {
  SignUpBloc() : super(InitialState());


  @override
  Stream<BaseState> mapEventToState(
      SignUpEvent event,
      ) async* {
    if (event is SignUpInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
    else if (event is LoginUserEvent) {
      dynamic response;
      yield LoadingState();

      final dynamic returnableValues = await APIRepository().dynamicRequest(
          HttpUrl.login,
          userArguments: jsonEncode(event.arguments),
          method: ApiRequestMethod.post,
          isBearerTokenNeed: false,
          context: event.context);

      response = LoginResponseModel.fromJson(returnableValues);
      print('================ ${returnableValues}');

      yield SuccessState(successResponse: response);

    }
  }
}