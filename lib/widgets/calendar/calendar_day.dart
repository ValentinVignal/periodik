import 'package:flutter/material.dart';
import 'package:periodik/utils/date_time.dart';

import '../../models/point_state.dart';

class CalendarDay extends StatelessWidget {
  const CalendarDay({
    required this.date,
    required this.onPressed,
    this.onLongPressed,
    this.state = PointState.none,
    super.key,
  });

  final DateTime date;

  final VoidCallback onPressed;

  final VoidCallback? onLongPressed;

  final PointState state;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final isToday = today.isSameDayAs(date);
    final theme = Theme.of(context);

    final backgroundColor = state.containerColor(theme);
    return InkWell(
      onTap: onPressed,
      onLongPress: onLongPressed,
      borderRadius: BorderRadius.circular(4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
          border: isToday
              ? Border.all(
                  color: theme.colorScheme.primary,
                  width: 2,
                )
              : null,
        ),
        child: SizedBox.expand(
          child: Center(
            child: Text(
              date.day.toString(),
              style: isToday
                  ? theme.textTheme.titleLarge!
                      .copyWith(color: theme.colorScheme.primary)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
