import 'package:collection/collection.dart';

import '../utils/auth.dart';
import '../utils/emails.dart';
import '../utils/k_verify_email.dart';
import 'routes.dart';

String? guardRedirect([Uri? uri]) {
  final firstSegment = uri?.pathSegments.firstOrNull;
  final user = Auth.instance.currentUser;
  if (user != null) {
    if (firstSegment == 'login') {
      return const HomeRoute().location;
    }
    if (!authorizedEmails.contains(user.email) &&
        !user.emailVerified &&
        kVerifyEmail) {
      if (firstSegment != 'verify-email') {
        return const VerifyEmailRoute().location;
      }
    } else {
      if (firstSegment == 'verify-email') {
        return const HomeRoute().location;
      }
    }
    if (firstSegment == null) return const SignalsRoute().location;
  } else {
    if (firstSegment != 'login') {
      return const LoginRoute().location;
    } else {
      return null;
    }
  }
  return null;
}
