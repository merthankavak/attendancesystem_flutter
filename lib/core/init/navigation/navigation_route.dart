import 'package:flutter/material.dart';

import '../../../view/authenticate/forgot_password/view/forgot_password_view.dart';
import '../../../view/authenticate/forgot_password/view/subview/change_password_view.dart';
import '../../../view/authenticate/forgot_password/view/subview/confirm_otp_view.dart';
import '../../../view/authenticate/login/view/login_view.dart';
import '../../../view/home/course/view/course_view.dart';
import '../../../view/home/course/view/subview/course_detail_settings_view.dart';
import '../../../view/home/course/view/subview/course_detail_view.dart';
import '../../components/card/not_found_card.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(LoginView());
      case NavigationConstants.FORGOT_PASSWORD_VIEW:
        return normalNavigate(ForgotPasswordView(typeOfUser: args.arguments.toString()));
      case NavigationConstants.CONFIRM_OTP_VIEW:
        return normalNavigate(ConfirmOtpView(
            email: args.arguments.toString().split(',')[0],
            typeOfUser: args.arguments.toString().split(',')[1]));
      case NavigationConstants.CHANGE_PASSWORD_VIEW:
        return normalNavigate(ChangePasswordView(
            otpCode: args.arguments.toString().split(',')[0],
            typeOfUser: args.arguments.toString().split(',')[1]));
      case NavigationConstants.COURSE_VIEW:
        return normalNavigate(CourseView(typeOfUser: args.arguments.toString()));
      case NavigationConstants.COURSE_DETAIL_VIEW:
        return normalNavigate(CourseDetailView(
            typeOfUser: args.arguments.toString().split(',')[0],
            courseId: args.arguments.toString().split(',')[1]));
      case NavigationConstants.COURSE_DETAIL_SETTINGS_VIEW:
        return normalNavigate(CourseDetailSettingsView(
            typeOfUser: args.arguments.toString().split(',')[0],
            courseId: args.arguments.toString().split(',')[1]));
      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
