import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/providers/signal_points_per_day_privoder.dart';
import 'package:periodik/screens/signals_calendar_day.dart';
import 'package:periodik/utils/date_time.dart';
import 'package:table_calendar/table_calendar.dart';

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

class _SignalCalendarContent extends ConsumerStatefulWidget {
  const _SignalCalendarContent();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __SignalCalendarContentState();
}

class __SignalCalendarContentState
    extends ConsumerState<_SignalCalendarContent> {
  var calendarFormat = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    const range = Duration(days: 100);

    Widget? builder(BuildContext context, DateTime day, DateTime focusedDay) {
      final points = ref.watch(
        signalPointsPerDayProvider(day.rounded),
      );
      return SignalsCalendarDay(
        date: day,
        focusedDate: focusedDay,
        points: points,
      );
    }

    return TableCalendar(
      startingDayOfWeek: StartingDayOfWeek.monday,
      focusedDay: now,
      firstDay: now.subtract(range),
      lastDay: now.add(range),
      calendarFormat: calendarFormat,
      shouldFillViewport: true,
      onFormatChanged: (format) {
        setState(() {
          calendarFormat = format;
        });
      },
      calendarBuilders: CalendarBuilders(
        todayBuilder: builder,
        defaultBuilder: builder,
        outsideBuilder: builder,
      ),
    );
  }
}
