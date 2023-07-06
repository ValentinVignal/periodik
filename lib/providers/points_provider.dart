import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/models/point.dart';
import 'package:periodik/providers/display_predictions_provider.dart';
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
      if (ref.watch(displayPredictionsProvider)) {
        return Cycles(points: points)..compute();
      } else {
        return Cycles.unpredictive(points: points);
      }
    });
  },
  dependencies: [
    pointsProvider,
    displayPredictionsProvider,
  ],
);
