import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:periodik/router/routes.dart';
import 'package:periodik/utils/k_verify_email.dart';

String? guardRedirect([String? location]) {
  final uri = location == null ? null : Uri.parse(location);
  final firstSegment = uri?.pathSegments.firstOrNull;
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    if (firstSegment == 'login') {
      return const HomeRoute().location;
    }
    if (!user.emailVerified && kVerifyEmail) {
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
