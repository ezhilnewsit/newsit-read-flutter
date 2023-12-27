
import 'package:flutter/cupertino.dart';

import '../../utils/base_equatable.dart';

abstract class WelcomeLangEvent extends BaseEquatable {}

class WelcomeLangInitialEvent extends WelcomeLangEvent {
  BuildContext? context;
  dynamic arguments;

  WelcomeLangInitialEvent({this.context});

}
