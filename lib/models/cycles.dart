import 'package:collection/collection.dart';

import '../utils/date_time.dart';
import '../widgets/calendar/calendar_day.dart';
import 'point.dart';

class Cycles {
  Cycles({
    required this.points,
  });

  final List<Point> points;
  Map<DateTime, Point>? _mapPoints;
  Map<DateTime, Point> get mapPoints =>
      _mapPoints ??
      Map.fromEntries(
        points.map((point) => MapEntry(point.date, point)),
      );

  final cycles = <Cycle>[];
  DateTime get firstDate => points.first.date;
  DateTime get lastDate => points.last.date;

  late final int _averageCycleLength;
  late final int _averageCycleActivationLength;

  void compute() {
    cycles.add(Cycle(start: firstDate));

    for (var day = firstDate;
        day.isBefore(lastDate);
        day = day.add(
      const Duration(days: 1),
    )) {
      final point = mapPoints[day];
      if (point != null) {
        if (point.state) {
          if (cycles.last.end.isAfter(day)) {
            cycles.last.verifiedActivations.add(day);
          } else {
            // Issue: The cycle is not active but the point is.
            // Should we extend the active duration of the current cycle or create a new one?
            if (day.difference(cycles.last.end) >=
                cycles.last.grossCycleEnd.difference(day)) {
              // We create a new cycle.
              cycles.add(Cycle(start: day));
            } else {
              // We extends the cycle to the current day.
              cycles.last.end = day.add(
                const Duration(days: 1),
              );
            }
          }
        } else {
          if (cycles.last.end.isBeforeOrSameAs(day)) {
            cycles.last.verifiedDeactivations.add(day);
          } else {
            // Issue: The cycle is active but the point is not.
            // Should we postpone the current cycle or shorten the activation duration?
            if (day.difference(cycles.last.start) >=
                cycles.last.end.difference(day)) {
              // We shorten the activation duration.
              cycles.last.end = day;
            } else {
              // We postpone the current cycle.
              cycles.last.start = day.add(const Duration(days: 1));
            }
          }
        }
      }
      if (day.isAfterOrSameAs(cycles.last.grossCycleEnd)) {
        // If the cycle might be finished, let's start a new one.
        cycles.add(Cycle(start: day));
      }
      // Else: The cycle is not finished yet. We don't need to do anything.
    }

    if (cycles.length > 1) {
      var averageCycleLength = 0;
      for (var i = 0; i < cycles.length - 1; i++) {
        averageCycleLength +=
            cycles[i + 1].start.difference(cycles[i].start).inDays;
      }
      _averageCycleLength = averageCycleLength ~/ (cycles.length - 1);
    } else {
      _averageCycleLength = Cycle._defaultLength;
    }
    _averageCycleActivationLength = cycles
        .map((cycle) => cycle.end.difference(cycle.start).inDays)
        .average
        .round();
  }

  CalendarDayState estimate(DateTime date) {
    if (mapPoints.containsKey(date)) {
      return mapPoints[date]!.state
          ? CalendarDayState.activated
          : CalendarDayState.deactivated;
    } else if (date.isBefore(cycles.first.start)) {
      return CalendarDayState.none;
    } else if (date.isBefore(lastDate)) {
      final cycle =
          cycles.lastWhere((cycle) => cycle.start.isBeforeOrSameAs(date));
      if (date.isBefore(cycle.end)) {
        return CalendarDayState.possiblyActivated;
      } else {
        return CalendarDayState.possiblyDeactivated;
      }
    } else if (date.isBefore(cycles.last.end)) {
      return CalendarDayState.possiblyActivated;
    } else {
      final lastCycleStartDate = cycles.last.start;
      final offsetInCycle =
          date.difference(lastCycleStartDate).inDays % _averageCycleLength;
      if (offsetInCycle < _averageCycleActivationLength) {
        return CalendarDayState.possiblyActivated;
      } else {
        return CalendarDayState.possiblyDeactivated;
      }
    }
  }
}

class Cycle {
  Cycle({
    required this.start,
    DateTime? end,
  }) : end = end ?? start.add(const Duration(days: 7));

  static const _defaultLength = 28;
  static const _defaultDuration = Duration(days: _defaultLength);

  DateTime start;
  DateTime end;
  final Set<DateTime> verifiedActivations = {};
  final Set<DateTime> verifiedDeactivations = {};

  DateTime get grossCycleEnd => start.add(_defaultDuration);
}
