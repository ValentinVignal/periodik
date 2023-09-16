import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/models/signal.dart';
import 'package:periodik/providers/settings_provider.dart';
import 'package:periodik/utils/collections.dart';

final signalsProvider = StreamProvider.autoDispose<List<Signal>>(
  (ref) async* {
    final displayHiddenSignals =
        ref.watch(settingsProvider).valueOrNull?.displayHiddenSignals ?? false;
    try {
      await for (final signals
          in Collections.signals.orderBy('name').snapshots()) {
        yield signals.docs.map((document) {
          return Signal.fromJsonDocument(
            document.id,
            document.data(),
          );
        }).where(
          (signal) {
            if (displayHiddenSignals) {
              return true;
            } else {
              return !signal.hidden;
            }
          },
        ).toList();
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'permission-denied') {
        // This can happen when the user logs out.
      } else {
        rethrow;
      }
    }
  },
  dependencies: [
    settingsProvider,
  ],
);
