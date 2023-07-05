import 'package:flutter/material.dart';
import 'package:periodik/utils/date_time.dart';

enum CalendarDayState {
  none,
  activated,
  deactivated,
  possiblyActivated,
  possiblyDeactivated,
}

class CalendarDay extends StatelessWidget {
  const CalendarDay({
    required this.date,
    required this.onPressed,
    this.onLongPressed,
    this.state = CalendarDayState.none,
    super.key,
  });

  final DateTime date;

  final VoidCallback onPressed;

  final VoidCallback? onLongPressed;

  final CalendarDayState state;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final isToday = today.isSameDayAs(date);
    final theme = Theme.of(context);

    final Color? backgroundColor;
    switch (state) {
      case CalendarDayState.none:
        backgroundColor = null;
        break;
      case CalendarDayState.activated:
        backgroundColor = theme.colorScheme.errorContainer.withOpacity(0.8);
        break;
      case CalendarDayState.deactivated:
        backgroundColor = theme.colorScheme.secondaryContainer.withOpacity(0.8);
        break;
      case CalendarDayState.possiblyActivated:
        backgroundColor = theme.colorScheme.errorContainer.withOpacity(0.2);
        break;
      case CalendarDayState.possiblyDeactivated:
        backgroundColor = theme.colorScheme.secondaryContainer.withOpacity(0.2);
        break;
    }
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
