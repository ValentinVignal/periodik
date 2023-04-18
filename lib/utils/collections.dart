import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:periodik/utils/user_notifier.dart';

mixin Collections {
  static DocumentReference get _userDocument => FirebaseFirestore.instance
      .collection(
        'users',
      )
      .doc(userNotifier.value!.uid);

  static CollectionReference<Map<String, dynamic>> get signals =>
      _userDocument.collection(
        'signals',
      );
}
