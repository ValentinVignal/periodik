import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:periodik/models/point.dart';
import 'package:periodik/providers/points_provider.dart';
import 'package:periodik/providers/signal_provider.dart';
import 'package:periodik/router/routes.dart';
import 'package:periodik/screens/point/point_dialog.dart';
import 'package:periodik/screens/signal/signal_list.dart';
import 'package:periodik/screens/signal/signal_view.dart';
import 'package:periodik/utils/collections.dart';
import 'package:periodik/utils/date_time.dart';
import 'package:periodik/utils/hero_tag.dart';
import 'package:periodik/widgets/calendar/calendar_day.dart';
import 'package:table_calendar/table_calendar.dart';

class SignalScreen extends StatelessWidget {
  const SignalScreen({
    required this.id,
    this.view = SignalView.calendar,
    super.key,
  });

  final String id;

  final SignalView view;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _SignalAppBar(
          id: id,
        ),
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).go(
                SignalRoute(
                  id: id,
                  view: view == SignalView.calendar
                      ? SignalView.list
                      : SignalView.calendar,
                ).location,
              );
            },
            icon: Icon(
              view == SignalView.calendar ? Icons.list : Icons.calendar_month,
            ),
          ),
        ],
      ),
      body: view == SignalView.calendar
          ? FractionallySizedBox(
              heightFactor: 0.8,
              child: _SignalContent(
                id: id,
              ),
            )
          : SignalList(
              id: id,
            ),
      floatingActionButton: _FAB(
        id: id,
      ),
    );
  }
}

class _SignalAppBar extends ConsumerWidget {
  const _SignalAppBar({
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      ref.watch(signalProvider(id)).asData?.value.name ?? '',
    );
  }
}

class _FAB extends StatelessWidget {
  const _FAB({
    required this.id,
  });

  final String id;

  void _onEdit(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _EditSignalDialog(id: id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: const EditHeroTag(),
          onPressed: () => _onEdit(context),
          child: const Icon(Icons.edit),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          onPressed: () => PointDialog.show(context: context, signalId: id),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class _EditSignalDialog extends ConsumerStatefulWidget {
  const _EditSignalDialog({
    required this.id,
  });

  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __EditSignalDialogState();
}

class __EditSignalDialogState extends ConsumerState<_EditSignalDialog> {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: ref.read(signalProvider(widget.id)).asData?.value.name,
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Signal'),
      content: TextFormField(
        controller: _textController,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            await Collections.signals.doc(widget.id).update({
              'name': _textController.text,
            });
            if (mounted) {
              Navigator.of(context).pop();
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}

class _SignalContent extends ConsumerStatefulWidget {
  const _SignalContent({
    required this.id,
  });

  final String id;

  @override
  ConsumerState<_SignalContent> createState() => _SignalContentState();
}

class _SignalContentState extends ConsumerState<_SignalContent> {
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
