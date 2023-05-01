import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/models/signal.dart';
import 'package:periodik/utils/collections.dart';

final signalsProvider = StreamProvider.autoDispose<List<Signal>>((ref) async* {
  await for (final signals in Collections.signals.orderBy('name').snapshots()) {
    yield signals.docs.map((document) {
      return Signal.fromJsonDocument(
        document.id,
        document.data(),
      );
    }).toList();
  }
});
