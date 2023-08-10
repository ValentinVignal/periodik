import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/models/signal.dart';
import 'package:periodik/providers/settings_provider.dart';
import 'package:periodik/utils/collections.dart';

final signalsProvider = StreamProvider.autoDispose<List<Signal>>(
  (ref) async* {
    final displayHiddenSignals =
        ref.watch(settingsProvider).valueOrNull?.displayHiddenSignals ?? false;
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
  },
  dependencies: [
    settingsProvider,
  ],
);
