import 'package:auto_route/auto_route_annotations.dart';
import 'package:ecommerce_flutter/pages/auth/login/login_page.dart';
import 'package:ecommerce_flutter/pages/auth/signup/signup_page.dart';
import 'package:ecommerce_flutter/pages/core/splash_page.dart';
import 'package:ecommerce_flutter/pages/home/home_page.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: LoginPage),
    MaterialRoute(page: SignUpPage),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: SplashPage, initial: true),
  ],
)
class $Router {}
