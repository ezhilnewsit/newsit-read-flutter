import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BaseEquatable extends Equatable {
  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) => false;
  @override
  // ignore: always_specify_types
  List<Object> get props => [];
}

showToast(String msg) {
  if (msg != '') {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1);
  }
}