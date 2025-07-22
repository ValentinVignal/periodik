import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import 'auth.dart';

mixin Collections {
  @visibleForTesting
  static FirebaseFirestore? mockInstance;

  static FirebaseFirestore get _instance {
    return mockInstance ?? FirebaseFirestore.instance;
  }

  static DocumentReference get _userDocument =>
      _instance.collection('users').doc(Auth.instance.currentUser!.uid);

  static CollectionReference<Map<String, dynamic>> get signals =>
      _userDocument.collection('signals');

  static CollectionReference<Map<String, dynamic>> points(String signalId) =>
      signals.doc(signalId).collection('points');

  static DocumentReference<Map<String, dynamic>> get settings =>
      _instance.collection('settings').doc(Auth.instance.currentUser!.uid);
}
