import 'package:flutter/material.dart';

import '../../../view/authenticate/forgot_password/view/forgot_password_view.dart';
import '../../../view/authenticate/forgot_password/view/subview/change_password_view.dart';
import '../../../view/authenticate/forgot_password/view/subview/confirm_otp_view.dart';
import '../../../view/authenticate/login/view/login_view.dart';
import '../../../view/authenticate/onboard/view/onboard_view.dart';
import '../../../view/authenticate/splash/view/splash_view.dart';
import '../../../view/home/attendance/view/attendance_view.dart';
import '../../../view/home/course/view/course_view.dart';
import '../../../view/home/course/view/subview/course_detail_settings_view.dart';
import '../../../view/home/course/view/subview/course_detail_view.dart';
import '../../../view/home/course/view/subview/course_schedule_view.dart';
import '../../../view/home/profile/view/profile_view.dart';
import '../../../view/settings/view/settings_view.dart';
import '../../components/card/not_found_card.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView());
      case NavigationConstants.ONBOARD_VIEW:
        return normalNavigate(const OnBoardView());
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(const LoginView());
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
      case NavigationConstants.COURSE_SCHEDULE_VIEW:
        return normalNavigate(CourseScheduleView(
            typeOfUser: args.arguments.toString().split(',')[0],
            courseId: args.arguments.toString().split(',')[1]));
      case NavigationConstants.COURSE_DETAIL_SETTINGS_VIEW:
        return normalNavigate(CourseDetailSettingsView(
            typeOfUser: args.arguments.toString().split(',')[0],
            courseId: args.arguments.toString().split(',')[1]));
      case NavigationConstants.ATTENDANCE_VIEW:
        return normalNavigate(AttendanceView(
            typeOfUser: args.arguments.toString().split(',')[0],
            courseId: args.arguments.toString().split(',')[1],
            date: args.arguments.toString().split(',')[2]));
      case NavigationConstants.PROFILE_VIEW:
        return normalNavigate(ProfileView(typeOfUser: args.arguments.toString()));
      case NavigationConstants.SETTINGS_VIEW:
        return normalNavigate(SettingsView(typeOfUser: args.arguments.toString()));
      default:
        return MaterialPageRoute(builder: (context) => const NotFoundNavigationWidget());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
