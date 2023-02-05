import 'package:community_managment/app/modules/add_event/bindings/add_event_binding.dart';
import 'package:community_managment/app/modules/add_event/views/add_event_view.dart';
import 'package:community_managment/app/modules/profile/bindings/profile_binding.dart';
import 'package:community_managment/app/modules/profile/profile_view.dart';
import 'package:community_managment/app/modules/sign_in/binding.dart';
import 'package:community_managment/app/modules/sign_in/view.dart';
import 'package:community_managment/app/modules/sign_up/binding.dart';
import 'package:community_managment/app/modules/sign_up/view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/onboarding/views/onboarding_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;
  static const SIGN_UP = Routes.SIGN_UP;
  static const SIGN_IN = Routes.SIGN_IN;
  static const ADD_EVENT = Routes.ADD_EVENT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EVENT,
      page: () => const AddEventView(),
      binding: AddEventBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
