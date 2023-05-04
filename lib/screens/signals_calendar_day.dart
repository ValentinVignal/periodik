import 'package:flutter/material.dart';
import 'package:periodik/models/point_with_signal.dart';
import 'package:periodik/utils/date_time.dart';

class SignalsCalendarDay extends StatelessWidget {
  const SignalsCalendarDay({
    required this.date,
    required this.focusedDate,
    required this.points,
    super.key,
  });

  final DateTime date;
  final DateTime focusedDate;
  final List<PointWithSignal> points;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final theme = Theme.of(context);
    final isToday = today.isSameDayAs(date);
    final isOtherMonth = focusedDate.month != date.month;
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: isToday
            ? Border.all(
                color: theme.colorScheme.primary,
                width: 2,
              )
            : null,
      ),
      child: Opacity(
        opacity: isOtherMonth ? 0.6 : 1,
        child: Center(
          child: ListView.builder(
            itemCount: points.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(date.day.toString()),
                );
              }
              final theme = Theme.of(context);
              final point = points[index - 1];
              return ColoredBox(
                color: point.point.state
                    ? theme.colorScheme.errorContainer
                    : theme.colorScheme.secondaryContainer,
                child: Text(point.signal.name,
                    style: TextStyle(
                        color: point.point.state
                            ? theme.colorScheme.onErrorContainer
                            : theme.colorScheme.onSecondaryContainer)),
              );
            },
          ),
        ),
      ),
    );
  }
}
