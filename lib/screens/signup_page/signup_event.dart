


import 'package:flutter/cupertino.dart';

import '../../utils/base_equatable.dart';

abstract class SignUpEvent extends BaseEquatable {}


class SignUpInitialEvent extends SignUpEvent {
  BuildContext? context;
  dynamic arguments;

  SignUpInitialEvent({this.context});

}

class LoginUserEvent extends SignUpEvent {

  LoginUserEvent({this.context, this.arguments});
  BuildContext? context;
  dynamic arguments;
}