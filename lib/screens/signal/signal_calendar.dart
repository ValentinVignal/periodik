import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/models/point.dart';
import 'package:periodik/providers/points_provider.dart';
import 'package:periodik/screens/point/delete_point.dart';
import 'package:periodik/screens/point/point_dialog.dart';
import 'package:periodik/utils/date_time.dart';
import 'package:periodik/widgets/calendar/calendar_day.dart';
import 'package:table_calendar/table_calendar.dart';

class SignalCalendar extends ConsumerStatefulWidget {
  const SignalCalendar({
    super.key,
    required this.id,
  });

  final String id;

  @override
  ConsumerState<SignalCalendar> createState() => _SignalContentState();
}

class _SignalContentState extends ConsumerState<SignalCalendar> {
  var calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    const range = Duration(days: 100);
    final points = ref
            .watch(
              pointsProvider(widget.id),
            )
            .asData
            ?.value ??
        const [];
    Widget? builder(BuildContext context, DateTime day, DateTime _) {
      final point = points.firstWhereOrNull(
        (element) => element.date.isSameDayAs(day),
      );
      final CalendarDayState calendarDayState;
      if (point == null) {
        calendarDayState = CalendarDayState.none;
      } else {
        if (point.state) {
          calendarDayState = CalendarDayState.activated;
        } else {
          calendarDayState = CalendarDayState.deactivated;
        }
      }
      return CalendarDay(
        date: day,
        state: calendarDayState,
        onPressed: () {
          PointDialog.show(
            context: context,
            signalId: widget.id,
            point: point ??
                Point(
                  id: '',
                  date: day,
                ),
          );
        },
        onLongPressed: point != null
            ? () => deletePoint(
                  context: context,
                  signalId: widget.id,
                  pointId: point.id,
                )
            : null,
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
      ),
    );
  }
}
