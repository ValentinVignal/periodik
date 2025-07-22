import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:periodik/models/signal_with_state.dart';
import 'package:periodik/router/routes.dart';
import 'package:periodik/utils/date_time.dart';

import '../models/point_state.dart';

class SignalsCalendarDay extends StatelessWidget {
  const SignalsCalendarDay({
    required this.date,
    required this.points,
    super.key,
  });

  final DateTime date;
  final List<SignalWithState> points;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final theme = Theme.of(context);
    final isToday = today.isSameDayAs(date);
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: isToday
            ? Border.all(color: theme.colorScheme.primary, width: 2)
            : null,
      ),
      child: Center(
        child: ListView.builder(
          primary: false,
          // shrinkWrap: true,
          itemCount: points.length + 1,
          itemBuilder: (context, index) {
            final theme = Theme.of(context);
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  date.day.toString(),
                  style: isToday
                      ? TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        )
                      : null,
                ),
              );
            }
            final point = points[index - 1];
            return Material(
              color: point.point.containerColor(theme),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: InkWell(
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).push(SignalRoute(id: point.signal.id).location);
                  },
                  child: Text(
                    point.signal.name,
                    style: TextStyle(
                      color: point.point.onContainerColor(theme),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
