import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/models/point.dart';
import 'package:periodik/utils/collections.dart';

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
