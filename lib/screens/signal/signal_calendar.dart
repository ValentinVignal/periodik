import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/point.dart';
import '../../providers/points_provider.dart';
import '../../utils/hero_tags.dart';
import '../../widgets/calendar/calendar.dart';
import '../../widgets/calendar/calendar_day.dart';
import '../point/delete_point.dart';
import '../point/point_dialog.dart';
import 'signal_screen_shell.dart';
import 'signal_view.dart';

class SignalCalendar extends ConsumerStatefulWidget {
  const SignalCalendar({
    super.key,
    required this.id,
  });

  final String id;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __SignalCalendarState();
}

class __SignalCalendarState extends ConsumerState<SignalCalendar> {
  final _controller = CalendarController();

  @override
  Widget build(BuildContext context) {
    final cycles = ref.watch(estimatedCyclesProvider(widget.id)).valueOrNull;
    Widget builder(BuildContext context, DateTime day) {
      final point = cycles?.mapPoints[day];
      final calendarDayState = cycles?.estimate(day) ?? CalendarDayState.none;
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

    return SignalScreenShell(
      id: widget.id,
      view: SignalView.calendar,
      floatingActionButton: FloatingActionButton(
        heroTag: const ResetViewHeroTag(),
        onPressed: () {
          _controller.resetView();
        },
        child: const Icon(Icons.my_location),
      ),
      child: Calendar(
        controller: _controller,
        view: CalendarView.compact,
        builder: builder,
      ),
    );
  }
}
