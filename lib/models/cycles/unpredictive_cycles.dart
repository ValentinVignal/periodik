import 'package:periodik/widgets/calendar/calendar_day.dart';

import '../cycles.dart';
import '../point.dart';

class UnpredictiveCycles implements Cycles {
  UnpredictiveCycles({
    required this.points,
  });

  @override
  final List<Point> points;

  Map<DateTime, Point>? _mapPoints;
  @override
  Map<DateTime, Point> get mapPoints =>
      _mapPoints ??
      Map.fromEntries(
        points.map((point) => MapEntry(point.date, point)),
      );

  @override
  void compute() {
    // Do nothing.
  }

  @override
  CalendarDayState estimate(DateTime date) {
    if (mapPoints.containsKey(date)) {
      return mapPoints[date]!.state
          ? CalendarDayState.activated
          : CalendarDayState.deactivated;
    }
    return CalendarDayState.none;
  }
}
