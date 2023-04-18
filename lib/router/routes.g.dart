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
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $verifyEmailRoute => GoRouteData.$route(
      path: '/verify-email',
      factory: $VerifyEmailRouteExtension._fromState,
    );

extension $VerifyEmailRouteExtension on VerifyEmailRoute {
  static VerifyEmailRoute _fromState(GoRouterState state) =>
      const VerifyEmailRoute();

  String get location => GoRouteData.$location(
        '/verify-email',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'sign-up',
          factory: $SignUpRouteExtension._fromState,
        ),
      ],
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SignUpRouteExtension on SignUpRoute {
  static SignUpRoute _fromState(GoRouterState state) => const SignUpRoute();

  String get location => GoRouteData.$location(
        '/login/sign-up',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $signalsRoute => GoRouteData.$route(
      path: '/signals',
      factory: $SignalsRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: ':id',
          factory: $SignalRouteExtension._fromState,
        ),
      ],
    );

extension $SignalsRouteExtension on SignalsRoute {
  static SignalsRoute _fromState(GoRouterState state) => const SignalsRoute();

  String get location => GoRouteData.$location(
        '/signals',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SignalRouteExtension on SignalRoute {
  static SignalRoute _fromState(GoRouterState state) => SignalRoute(
        id: state.params['id']!,
      );

  String get location => GoRouteData.$location(
        '/signals/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
