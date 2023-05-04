import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:periodik/router/redirect.dart';
import 'package:periodik/screens/login_screen.dart';
import 'package:periodik/screens/sign_up_screen.dart';
import 'package:periodik/screens/signal/signal_view.dart';
import 'package:periodik/screens/signals_calendar_screen.dart';
import 'package:periodik/screens/signals_screen.dart';
import 'package:periodik/screens/verify_email_screen.dart';

import '../screens/signal/signal_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return guardRedirect();
  }
}

@TypedGoRoute<VerifyEmailRoute>(path: '/verify-email')
class VerifyEmailRoute extends GoRouteData {
  const VerifyEmailRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const VerifyEmailScreen();
  }
}

@TypedGoRoute<LoginRoute>(
  path: '/login',
  routes: [
    TypedGoRoute<SignUpRoute>(path: 'sign-up'),
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

@TypedGoRoute<SignalsRoute>(
  path: '/signals',
  routes: [
    TypedGoRoute<SignalsCalendarRoute>(path: 'calendar'),
    TypedGoRoute<SignalRoute>(path: ':id'),
    TypedGoRoute<SignalCalendarRoute>(path: ':id/calendar'),
    TypedGoRoute<SignalListRoute>(path: ':id/list'),
  ],
)
class SignalsRoute extends GoRouteData {
  const SignalsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignalsScreen();
  }
}

class SignalsCalendarRoute extends GoRouteData {
  const SignalsCalendarRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignalsCalendarScreen();
  }
}

class SignalRoute extends GoRouteData {
  const SignalRoute({
    required this.id,
  });

  final String id;

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return SignalCalendarRoute(id: id).location;
  }
}

class SignalCalendarRoute extends GoRouteData {
  const SignalCalendarRoute({
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SignalScreen(
      id: id,
      view: SignalView.calendar,
    );
  }
}

class SignalListRoute extends GoRouteData {
  const SignalListRoute({
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SignalScreen(
      id: id,
      view: SignalView.list,
    );
  }
}
