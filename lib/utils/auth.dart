import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

mixin Auth {
  @visibleForTesting
  static FirebaseAuth? mockInstance;

  static FirebaseAuth get instance {
    return mockInstance ?? FirebaseAuth.instance;
  }
}
