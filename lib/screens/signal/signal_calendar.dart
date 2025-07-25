import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/utils/date_time.dart';
import 'package:periodik/utils/scroll_controller.dart';

import '../../models/point.dart';
import '../../models/point_state.dart';
import '../../providers/points_provider.dart';
import '../../utils/hero_tags.dart';
import '../../widgets/calendar/calendar.dart';
import '../../widgets/calendar/calendar_day.dart';
import '../point/delete_point.dart';
import '../point/point_dialog.dart';
import 'signal_screen_shell.dart';
import 'signal_view.dart';

class SignalCalendar extends ConsumerStatefulWidget {
  const SignalCalendar({super.key, required this.id});

  final String id;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __SignalCalendarState();
}

class __SignalCalendarState extends ConsumerState<SignalCalendar> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cycles = ref.watch(estimatedCyclesProvider(widget.id)).valueOrNull;
    Widget builder(BuildContext context, DateTime day) {
      final point = cycles?.mapPoints[day.rounded];
      final calendarDayState = cycles?.estimate(day) ?? PointState.none;
      return CalendarDay(
        date: day,
        state: calendarDayState,
        onPressed: () {
          PointDialog.show(
            context: context,
            signalId: widget.id,
            point: point ?? Point(id: '', date: day),
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
        onPressed: _controller.scrollToCenter,
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
