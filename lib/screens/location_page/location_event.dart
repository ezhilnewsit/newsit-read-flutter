

import 'package:flutter/cupertino.dart';

import '../../utils/base_equatable.dart';

abstract class LocationEvent extends BaseEquatable {}

class LocationInitialEvent extends LocationEvent {
  BuildContext? context;
  dynamic arguments;

  LocationInitialEvent({this.context});

}
