import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/models/signal_with_state.dart';
import 'package:periodik/providers/signals_with_points_provider.dart';
import 'package:periodik/utils/date_time.dart';

import '../models/point_state.dart';

final signalPointsPerDayProvider = Provider.family
    .autoDispose<List<SignalWithState>, DateTime>((ref, day) {
      final signalsWithPoints =
          ref.watch(signalsWithPointsProvider).asData?.value ?? const [];
      return signalsWithPoints
          .map(
            (signal) => signal.copyWith(
              points: signal.points
                  .where((point) => point.date.isSameDayAs(day))
                  .toList(),
            ),
          )
          .where((signal) => signal.points.isNotEmpty)
          .expand(
            (signal) => signal.points.map(
              (point) => SignalWithState(
                signal: signal.signal,
                point: point.state
                    ? PointState.activated
                    : PointState.deactivated,
              ),
            ),
          )
          .toList();
    }, dependencies: [signalsWithPointsProvider]);
