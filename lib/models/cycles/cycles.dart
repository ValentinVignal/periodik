import 'package:collection/collection.dart';
import 'package:periodik/models/point_state.dart';

import '../../utils/date_time.dart';
import '../point.dart';
import 'non_predictive_cycles.dart';

class Cycles {
  Cycles({
    required this.points,
  });

  factory Cycles.nonPredictive({
    required List<Point> points,
  }) = NonPredictiveCycles;

  final List<Point> points;
  Map<DateTime, Point>? _mapPoints;
  Map<DateTime, Point> get mapPoints => _mapPoints ??= Map.fromEntries(
        points.map((point) => MapEntry(point.date.rounded, point)),
      );

  final _cycles = <Cycle>[];
  DateTime get _firstDate => points.first.date;
  DateTime get _lastDate => points.last.date;

  late final int _averageCycleLength;
  late final int _averageCycleActivationLength;

  void compute() {
    _cycles.add(Cycle(start: _firstDate));

    for (var day = _firstDate;
        day.isBefore(_lastDate);
        day = day.add(
      const Duration(days: 1),
    )) {
      final point = mapPoints[day];
      if (point != null) {
        if (point.state) {
          if (_cycles.last.end.isAfter(day)) {
            _cycles.last.verifiedActivations.add(day);
          } else {
            // Issue: The cycle is not active but the point is.
            // Should we extend the active duration of the current cycle or create a new one?
            if (day.difference(_cycles.last.end) >=
                _cycles.last.grossCycleEnd.difference(day)) {
              // We create a new cycle.
              _cycles.add(Cycle(start: day));
            } else {
              // We extends the cycle to the current day.
              _cycles.last.end = day.add(
                const Duration(days: 1),
              );
            }
          }
        } else {
          if (_cycles.last.end.isBeforeOrSameAs(day)) {
            _cycles.last.verifiedDeactivations.add(day);
          } else {
            // Issue: The cycle is active but the point is not.
            // Should we postpone the current cycle or shorten the activation duration?
            if (day.difference(_cycles.last.start) >=
                _cycles.last.end.difference(day)) {
              // We shorten the activation duration.
              _cycles.last.end = day;
            } else {
              // We postpone the current cycle.
              _cycles.last.start = day.add(const Duration(days: 1));
            }
          }
        }
      }
      if (day.isAfterOrSameAs(_cycles.last.grossCycleEnd)) {
        // If the cycle might be finished, let's start a new one.
        _cycles.add(Cycle(start: day));
      }
      // Else: The cycle is not finished yet. We don't need to do anything.
    }

    if (_cycles.length > 1) {
      var averageCycleLength = 0;
      for (var i = 0; i < _cycles.length - 1; i++) {
        averageCycleLength +=
            _cycles[i + 1].start.difference(_cycles[i].start).inDays;
      }
      _averageCycleLength = averageCycleLength ~/ (_cycles.length - 1);
    } else {
      _averageCycleLength = Cycle._defaultLength;
    }
    _averageCycleActivationLength = _cycles
        .map((cycle) => cycle.end.difference(cycle.start).inDays)
        .average
        .round();
  }

  PointState estimate(DateTime date) {
    if (mapPoints.containsKey(date)) {
      return mapPoints[date]!.state
          ? PointState.activated
          : PointState.deactivated;
    } else if (date.isBefore(_cycles.first.start)) {
      return PointState.none;
    } else if (date.isBefore(_lastDate)) {
      final cycle =
          _cycles.lastWhere((cycle) => cycle.start.isBeforeOrSameAs(date));
      if (date.isBefore(cycle.end)) {
        return PointState.possiblyActivated;
      } else {
        return PointState.possiblyDeactivated;
      }
    } else if (date.isBefore(_cycles.last.end)) {
      return PointState.possiblyActivated;
    } else {
      final lastCycleStartDate = _cycles.last.start;
      final offsetInCycle =
          date.difference(lastCycleStartDate).inDays % _averageCycleLength;
      if (offsetInCycle < _averageCycleActivationLength) {
        return PointState.possiblyActivated;
      } else {
        return PointState.possiblyDeactivated;
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
