import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/models/point.dart';
import 'package:periodik/utils/collections.dart';

import '../models/cycles.dart';

final pointsProvider = StreamProvider.autoDispose.family<List<Point>, String>(
  (ref, signalId) async* {
    await for (final points in Collections.points(
      signalId,
    ).orderBy('date').snapshots()) {
      yield points.docs.map((document) {
        return Point.fromJsonDocument(
          document.id,
          document.data(),
        );
      }).toList();
    }
  },
);

final estimatedCyclesProvider =
    Provider.autoDispose.family<AsyncValue<Cycles>, String>(
  (ref, signalId) {
    return ref.watch(pointsProvider(signalId)).whenData((points) {
      return Cycles(points: points)..compute();
    });
  },
  dependencies: [
    pointsProvider,
  ],
);
