import 'package:periodik/utils/date_time.dart';

import '../point.dart';
import '../point_state.dart';
import 'cycles.dart';

class UnpredictiveCycles implements Cycles {
  UnpredictiveCycles({
    required this.points,
  });

  @override
  final List<Point> points;

  Map<DateTime, Point>? _mapPoints;
  @override
  Map<DateTime, Point> get mapPoints => _mapPoints ??= Map.fromEntries(
        points.map((point) => MapEntry(point.date.rounded, point)),
      );

  @override
  void compute() {
    // Do nothing.
  }

  @override
  PointState estimate(DateTime date) {
    if (mapPoints.containsKey(date)) {
      return mapPoints[date]!.state
          ? PointState.activated
          : PointState.deactivated;
    }
    return PointState.none;
  }
}
