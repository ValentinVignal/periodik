import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

mixin Collections {
  static DocumentReference get _userDocument => FirebaseFirestore.instance
      .collection(
        'users',
      )
      .doc(FirebaseAuth.instance.currentUser!.uid);

  static CollectionReference<Map<String, dynamic>> get signals =>
      _userDocument.collection(
        'signals',
      );

  static CollectionReference<Map<String, dynamic>> points(String signalId) =>
      signals.doc(signalId).collection('points');

  static DocumentReference<Map<String, dynamic>> get settings =>
      FirebaseFirestore.instance
          .collection(
            'settings',
          )
          .doc(FirebaseAuth.instance.currentUser!.uid);
}
