import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:periodik/screens/home_screen.dart';
import 'package:periodik/screens/login_screen.dart';
import 'package:periodik/screens/sign_up_screen.dart';
import 'package:periodik/screens/verify_email_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

@TypedGoRoute<LoginRoute>(
  path: '/login',
  routes: [
    TypedGoRoute<SignUpRoute>(
      path: 'sign-up',
      routes: [
        TypedGoRoute<VerifyEmailRoute>(path: 'verify-email'),
      ],
    )
  ],
)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}

class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpScreen();
  }
}

class VerifyEmailRoute extends GoRouteData {
  const VerifyEmailRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const VerifyEmailScreen();
  }
}
