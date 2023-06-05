import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/models/point.dart';
import 'package:periodik/providers/points_provider.dart';
import 'package:periodik/screens/point/delete_point.dart';
import 'package:periodik/screens/point/point_dialog.dart';
import 'package:periodik/utils/date_time.dart';
import 'package:periodik/widgets/calendar/calendar_day.dart';

import '../../widgets/calendar/calendar.dart';

class SignalCalendar extends ConsumerWidget {
  const SignalCalendar({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final points = ref
            .watch(
              pointsProvider(id),
            )
            .asData
            ?.value ??
        const [];
    Widget builder(BuildContext context, DateTime day) {
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
            signalId: id,
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
                  signalId: id,
                  pointId: point.id,
                )
            : null,
      );
    }

    return Calendar(
      builder: builder,
    );
  }
}
