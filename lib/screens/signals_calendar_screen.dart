import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/models/signal_with_state.dart';
import 'package:periodik/providers/points_provider.dart';
import 'package:periodik/providers/signal_points_per_day_provider.dart';
import 'package:periodik/providers/signals_provider.dart';
import 'package:periodik/screens/signals_calendar_day.dart';
import 'package:periodik/utils/date_time.dart';
import 'package:periodik/widgets/calendar/calendar.dart';

import '../models/point_state.dart';
import '../providers/display_predictions_provider.dart';
import '../utils/hero_tags.dart';

enum _Action {
  displayPredictions,
}

class SignalsCalendarScreen extends ConsumerStatefulWidget {
  const SignalsCalendarScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __SignalsCalendarScreenState();
}

class __SignalsCalendarScreenState
    extends ConsumerState<SignalsCalendarScreen> {
  final _controller = CalendarController();

  void _onSelected(_Action action) {
    switch (action) {
      case _Action.displayPredictions:
        ref.read(displayPredictionsProvider.notifier).update((state) => !state);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget builder(BuildContext context, DateTime day) {
      final List<SignalWithState> points;
      if (ref.watch(displayPredictionsProvider)) {
        points = ref.watch(signalsProvider).valueOrNull?.map((signal) {
              final cycle =
                  ref.watch(estimatedCyclesProvider(signal.id)).valueOrNull;
              final point = cycle?.estimate(day) ?? PointState.none;
              return SignalWithState(signal: signal, point: point);
            }).toList() ??
            const [];
      } else {
        points = ref.watch(
          signalPointsPerDayProvider(day.rounded),
        );
      }
      return SignalsCalendarDay(
        date: day,
        points: points,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Signals Calendar'),
        actions: [
          PopupMenuButton<_Action>(
            onSelected: _onSelected,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: _Action.displayPredictions,
                child: Consumer(builder: (context, ref, child) {
                  final displayPredictions =
                      ref.watch(displayPredictionsProvider);
                  return Text(
                    '${displayPredictions ? 'Hide' : 'Display'} predictions',
                  );
                }),
              ),
            ],
          )
        ],
      ),
      body: Center(
        child: Calendar(
          controller: _controller,
          view: CalendarView.cozy,
          builder: builder,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: const ResetViewHeroTag(),
        onPressed: () {
          _controller.resetView();
        },
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
