import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsit_read/screens/location_page/location_bloc.dart';
import 'package:newsit_read/screens/location_page/location_event.dart';
import 'package:newsit_read/screens/location_page/location_screen.dart';
import 'package:newsit_read/screens/login_page/login_bloc.dart';
import 'package:newsit_read/screens/login_page/login_event.dart';
import 'package:newsit_read/screens/login_page/login_screen.dart';
import 'package:newsit_read/screens/otp_page/otp_bloc.dart';
import 'package:newsit_read/screens/otp_page/otp_event.dart';
import 'package:newsit_read/screens/otp_page/otp_screen.dart';
import 'package:newsit_read/screens/page_inprogress.dart';
import 'package:newsit_read/screens/signup_page/signup_bloc.dart';
import 'package:newsit_read/screens/signup_page/signup_event.dart';
import 'package:newsit_read/screens/signup_page/signup_screen.dart';
import 'package:newsit_read/screens/welcome_language/welcome_lang_bloc.dart';
import 'package:newsit_read/screens/welcome_language/welcome_lang_event.dart';
import 'package:newsit_read/screens/welcome_language/welcome_lang_screen.dart';

import 'authentication/bloc/authentication_bloc.dart';


class AppRoutes {
  static const String splashScreen = 'splash_screen';
  static const String loginScreen = 'login_screen';
  static const String signUpScreen = 'sigup_screen';
  static const String welcomeLangScreen = 'welcome_lang_screen';
  static const String otpScreen = 'otp_screen';
  static const String locationScreen = 'location_screen';
}

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginScreen:
      return _buildLoginScreen();
    case AppRoutes.signUpScreen:
      return _buildSignUpScreen();
    case AppRoutes.welcomeLangScreen:
      return _buildWelcomeLangScreen();
    case AppRoutes.otpScreen:
      return _buildOtpScreen();
    case AppRoutes.locationScreen:
      return _buildLocationScreen();
  }
  return _buildInProgressScreen();
}

Route<dynamic> _buildLoginScreen() {
  return MaterialPageRoute(
    builder: (BuildContext context) =>
        addAuthBloc(context, PageBuilder.buildLoginScreen()),
  );
}

Route<dynamic> _buildInProgressScreen() {
  return MaterialPageRoute(
    builder: (BuildContext context) =>
        addAuthBloc(context, PageBuilder.buildInProgressScreen()),
  );
}

Route<dynamic> _buildSignUpScreen() {
  return MaterialPageRoute(
    builder: (BuildContext context) =>
        addAuthBloc(context, PageBuilder.buildSignUpScreen()),
  );
}

Route<dynamic> _buildWelcomeLangScreen() {
  return MaterialPageRoute(
    builder: (BuildContext context) =>
        addAuthBloc(context, PageBuilder.buildWelcomeLangScreen()),
  );
}

Route<dynamic> _buildOtpScreen() {
  return MaterialPageRoute(
    builder: (BuildContext context) =>
        addAuthBloc(context, PageBuilder.buildOtpScreen()),
  );
}

Route<dynamic> _buildLocationScreen() {
  return MaterialPageRoute(
    builder: (BuildContext context) =>
        addAuthBloc(context, PageBuilder.buildLocationScreen()),
  );
}

class PageBuilder {
  static Widget buildInProgressScreen() {
    return BlocProvider(
      create: (BuildContext context) =>
          BlocProvider.of<AuthenticationBloc>(context),
      child: const InProgressScreen(),
    );
  }

  static Widget buildLoginScreen() {
    return BlocProvider(
      create: (BuildContext context) =>
          LoginBloc()..add(LoginInitialEvent(context: context)),
      child: const LoginScreen(),
    );
  }

  static Widget buildSignUpScreen() {
    return BlocProvider(
      create: (BuildContext context) =>
      SignUpBloc()..add(SignUpInitialEvent(context: context)),
      child: const SignUpScreen(),
    );
  }

  static Widget buildWelcomeLangScreen() {
    return BlocProvider(
      create: (BuildContext context) =>
      WelcomeLangBloc()..add(WelcomeLangInitialEvent(context: context)),
      child: const WelcomeLangScreen(),
    );
  }

  static Widget buildOtpScreen() {
    return BlocProvider(
      create: (BuildContext context) =>
      OTPBloc()..add(OTPInitialEvent(context: context)),
      child: const OTPScreen(),
    );
  }

  // buildLocationScreen

  static Widget buildLocationScreen() {
    return BlocProvider(
      create: (BuildContext context) =>
      LocationBloc()..add(LocationInitialEvent(context: context)),
      child: const LocationScreen(),
    );
  }
}

Widget addAuthBloc(BuildContext context, Widget widget) {
  print('========= add Auth data=======');
  return BlocListener(
    bloc: BlocProvider.of<AuthenticationBloc>(context),
    listener: (BuildContext context, Object? state) async {
      if (state is AuthenticationUnAuthenticated) {
        while (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        await Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
      }

      if (state is AuthenticationAuthenticated) {
        while (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      }

      // if (state is AuthenticationAuthenticated) {
      //   while (Navigator.canPop(context)) {
      //     Navigator.pop(context);
      //   }
      // }
    },
    child: BlocBuilder(
      bloc: BlocProvider.of<AuthenticationBloc>(context),
      builder: (BuildContext context, Object? state) {
        return widget;
      },
    ),
  );
}
