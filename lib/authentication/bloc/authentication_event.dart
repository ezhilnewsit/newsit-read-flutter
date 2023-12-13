part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends BaseEquatable {}

class AppStarted extends AuthenticationEvent {
  BuildContext? context;

  AppStarted({this.context});
}

class LoggedIn extends AuthenticationEvent {}

class LoggedOut extends AuthenticationEvent {}

class SessionLogout extends AuthenticationEvent {}

class LocationEvent extends AuthenticationEvent {
  LocationEvent({this.context});

  BuildContext? context;
}

// class InternetEvent extends AuthenticationEvent {
//   BuildContext? context;
//   // ConnectivityResult? connectivityResult;

//   InternetEvent({this.context, this.connectivityResult});
// }
