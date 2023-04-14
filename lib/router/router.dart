import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:periodik/router/routes.dart';
import 'package:periodik/utils/k_verify_email.dart';

final _userNotifier = ValueNotifier<User?>(null);

final router = _getRouter();

GoRouter _getRouter() {
  FirebaseAuth.instance.userChanges().listen(
        (user) => _userNotifier.value = user,
      );
  return GoRouter(
    refreshListenable: _userNotifier,
    redirect: (BuildContext context, GoRouterState state) {
      final uri = Uri.parse(state.location);
      final firstSegment = uri.pathSegments.firstOrNull;
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        if (user.emailVerified || !kVerifyEmail) {
          if (firstSegment == 'login') {
            return const HomeRoute().location;
          }
        } else {
          if (firstSegment != 'login') {
            return const LoginRoute().location;
          }
        }
      } else if (firstSegment != 'login') {
        return const LoginRoute().location;
      }
      return null;
    },
    routes: $appRoutes,
  );
}