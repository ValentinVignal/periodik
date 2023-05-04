import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/models/signal_with_points.dart';
import 'package:periodik/providers/points_provider.dart';
import 'package:periodik/providers/signals_provider.dart';

final signalsWithPointsProvider =
    Provider.autoDispose<AsyncValue<List<SignalWithPoints>>>(
  (ref) {
    return ref.watch(signalsProvider).whenData(
          (value) => value
              .map(
                (signal) => SignalWithPoints(
                  signal: signal,
                  points: ref.watch(pointsProvider(signal.id)).asData?.value ??
                      const [],
                ),
              )
              .toList(),
        );
  },
  dependencies: [
    signalsProvider,
    pointsProvider,
  ],
);
