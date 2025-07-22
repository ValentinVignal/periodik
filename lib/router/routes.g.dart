// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $homeRoute,
  $verifyEmailRoute,
  $loginRoute,
  $signalsRoute,
  $settingsRoute,
];

RouteBase get $homeRoute =>
    GoRouteData.$route(path: '/', factory: _$HomeRoute._fromState);

mixin _$HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $verifyEmailRoute => GoRouteData.$route(
  path: '/verify-email',
  factory: _$VerifyEmailRoute._fromState,
);

mixin _$VerifyEmailRoute on GoRouteData {
  static VerifyEmailRoute _fromState(GoRouterState state) =>
      const VerifyEmailRoute();

  @override
  String get location => GoRouteData.$location('/verify-email');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login',
  factory: _$LoginRoute._fromState,
  routes: [
    GoRouteData.$route(path: 'sign-up', factory: _$SignUpRoute._fromState),
  ],
);

mixin _$LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SignUpRoute on GoRouteData {
  static SignUpRoute _fromState(GoRouterState state) => const SignUpRoute();

  @override
  String get location => GoRouteData.$location('/login/sign-up');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $signalsRoute => GoRouteData.$route(
  path: '/signals',
  factory: _$SignalsRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'calendar',
      factory: _$SignalsCalendarRoute._fromState,
    ),
    GoRouteData.$route(path: ':id', factory: _$SignalRoute._fromState),
    GoRouteData.$route(
      path: ':id/calendar',
      factory: _$SignalCalendarRoute._fromState,
    ),
    GoRouteData.$route(path: ':id/list', factory: _$SignalListRoute._fromState),
  ],
);

mixin _$SignalsRoute on GoRouteData {
  static SignalsRoute _fromState(GoRouterState state) => const SignalsRoute();

  @override
  String get location => GoRouteData.$location('/signals');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SignalsCalendarRoute on GoRouteData {
  static SignalsCalendarRoute _fromState(GoRouterState state) =>
      const SignalsCalendarRoute();

  @override
  String get location => GoRouteData.$location('/signals/calendar');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SignalRoute on GoRouteData {
  static SignalRoute _fromState(GoRouterState state) =>
      SignalRoute(id: state.pathParameters['id']!);

  SignalRoute get _self => this as SignalRoute;

  @override
  String get location =>
      GoRouteData.$location('/signals/${Uri.encodeComponent(_self.id)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SignalCalendarRoute on GoRouteData {
  static SignalCalendarRoute _fromState(GoRouterState state) =>
      SignalCalendarRoute(id: state.pathParameters['id']!);

  SignalCalendarRoute get _self => this as SignalCalendarRoute;

  @override
  String get location => GoRouteData.$location(
    '/signals/${Uri.encodeComponent(_self.id)}/calendar',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SignalListRoute on GoRouteData {
  static SignalListRoute _fromState(GoRouterState state) =>
      SignalListRoute(id: state.pathParameters['id']!);

  SignalListRoute get _self => this as SignalListRoute;

  @override
  String get location =>
      GoRouteData.$location('/signals/${Uri.encodeComponent(_self.id)}/list');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $settingsRoute =>
    GoRouteData.$route(path: '/settings', factory: _$SettingsRoute._fromState);

mixin _$SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
