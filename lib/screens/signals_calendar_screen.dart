import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/providers/signal_points_per_day_privoder.dart';
import 'package:periodik/screens/signals_calendar_day.dart';
import 'package:periodik/utils/date_time.dart';
import 'package:periodik/widgets/calendar/calendar.dart';

class SignalsCalendarScreen extends StatelessWidget {
  const SignalsCalendarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signals Calendar'),
      ),
      body: const Center(
        child: _SignalCalendarContent(),
      ),
    );
  }
}

class _SignalCalendarContent extends ConsumerWidget {
  const _SignalCalendarContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget builder(BuildContext context, DateTime day) {
      final points = ref.watch(
        signalPointsPerDayProvider(day.rounded),
      );
      return SignalsCalendarDay(
        date: day,
        points: points,
      );
    }

    return Calendar(
      builder: builder,
    );
  }
}
