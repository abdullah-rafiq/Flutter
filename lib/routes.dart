import 'package:flutter/material.dart';
import 'package:x/Proifle/profile.dart';
import 'package:x/drawer/bookmark.dart';
import 'package:x/drawer/jobs.dart';
import 'package:x/drawer/lists.dart';
import 'package:x/drawer/monitization.dart';
import 'package:x/drawer/spaces.dart';
import 'package:x/drawer/timeline_setting.dart';
import 'package:x/screens/login screens/log_in_screen.dart';
import 'package:x/screens/home_screen.dart';
import 'package:x/screens/login%20screens/forgot_password.dart';
import 'package:x/screens/sigin screens/sign_in_screen.dart';
import 'package:x/screens/sigin screens/sign_in_verification.dart';
import 'package:x/screens/sigin screens/sign_next.dart';
import 'package:x/screens/splash screen/splash_screen.dart';
import 'package:x/drawer/setting.dart';

final Map<String, WidgetBuilder> routes = {
  '/splash_sc': (context) => const SplashScreen(),
  '/log_in_sc': (context) => const LogInScreen(),
  '/sign_in_sc': (context) => const SignInScreen(),
  "/sign_next_sc": (context) => const SignNext(),
  "/home_sc": (context) => const HomeScreen(),
  "/sign_verification_sc": (context) => const SignInVerificationSc(),
  "/forgot_password_sc": (context) => const ForgotPassword(),
  "/profile_sc": (context) => const Profile(),
  "/setting_sc": (context) => const SettingScreen(),
  "/bookmarks": (context) => const BookmarksScreen(),
  "/jobs_sc": (context) => const JobsScreen(),
  "/lists_sc": (context) => const ListsScreen(),
  "/spaces_sc": (context) => const SpacesScreeen(),
  "/moni_sc": (context) => const MonitizationScreen(),
  "/timeline_setting_sc": (context) => const TimelineSetting(),
};
