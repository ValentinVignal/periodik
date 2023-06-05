import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/providers/signal_points_per_day_provider.dart';
import 'package:periodik/screens/signals_calendar_day.dart';
import 'package:periodik/utils/date_time.dart';
import 'package:periodik/widgets/calendar/calendar.dart';

import '../utils/hero_tags.dart';

class SignalsCalendarScreen extends ConsumerStatefulWidget {
  const SignalsCalendarScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __SignalsCalendarScreenState();
}

class __SignalsCalendarScreenState
    extends ConsumerState<SignalsCalendarScreen> {
  final _controller = CalendarController();
  @override
  Widget build(BuildContext context) {
    Widget builder(BuildContext context, DateTime day) {
      final points = ref.watch(
        signalPointsPerDayProvider(day.rounded),
      );
      return SignalsCalendarDay(
        date: day,
        points: points,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Signals Calendar'),
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
