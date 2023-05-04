import 'package:flutter/material.dart';
import 'package:periodik/models/point_with_signal.dart';

class SignalsCalendarDay extends StatelessWidget {
  const SignalsCalendarDay({
    required this.points,
    super.key,
  });

  final List<PointWithSignal> points;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListView.builder(
        itemCount: points.length,
        itemBuilder: (context, index) {
          final theme = Theme.of(context);
          final point = points[index];
          return ColoredBox(
            color: point.point.state
                ? theme.colorScheme.errorContainer
                : theme.colorScheme.secondaryContainer,
            child: Text(point.signal.name),
          );
        },
      ),
    );
  }
}
