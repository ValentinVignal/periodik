import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/models/signal.dart';
import 'package:periodik/utils/collections.dart';

final signalProvider = StreamProvider.autoDispose.family<Signal, String>((
  ref,
  id,
) async* {
  await for (final snapshot in Collections.signals.doc(id).snapshots()) {
    yield Signal.fromJsonDocument(snapshot.id, snapshot.data()!);
  }
});
