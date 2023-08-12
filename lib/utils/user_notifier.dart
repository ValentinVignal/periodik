import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'auth.dart';

final userNotifier = _getUserNotifier();

ValueNotifier<User?> _getUserNotifier() {
  final logger = Logger('userNotifier');
  final userNotifier = ValueNotifier<User?>(null);

  Auth.instance.userChanges().listen(
    (user) {
      logger.config('User: $user');
      userNotifier.value = user;
    },
  );
  return userNotifier;
}
