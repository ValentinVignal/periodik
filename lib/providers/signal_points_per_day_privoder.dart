import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/models/point_with_signal.dart';
import 'package:periodik/providers/signals_with_points_provider.dart';
import 'package:periodik/utils/date_time.dart';

final signalPointsPerDayProvider =
    Provider.family.autoDispose<List<PointWithSignal>, DateTime>(
  (ref, day) {
    final signalsWithPoints =
        ref.watch(signalsWithPointsProvider).asData?.value ?? const [];
    return signalsWithPoints
        .map(
          (signal) => signal.copyWith(
            points: signal.points
                .where(
                  (point) => point.date.isSameDayAs(day),
                )
                .toList(),
          ),
        )
        .where((signal) => signal.points.isNotEmpty)
        .expand(
          (signal) => signal.points.map(
            (point) => PointWithSignal(signal: signal.signal, point: point),
          ),
        )
        .toList();
  },
  dependencies: [
    signalsWithPointsProvider,
  ],
);
