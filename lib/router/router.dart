import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:periodik/router/redirect.dart';
import 'package:periodik/router/routes.dart';

import '../utils/user_notifier.dart';

final router = _getRouter();

GoRouter _getRouter() {
  return GoRouter(
    refreshListenable: userNotifier,
    redirect: (BuildContext context, GoRouterState state) {
      return guardRedirect(state.location);
    },
    routes: $appRoutes,
  );
}
