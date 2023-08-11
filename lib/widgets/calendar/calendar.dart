import 'dart:math';

import 'package:flutter/material.dart';
import 'package:periodik/utils/date_time.dart';

enum CalendarView {
  compact,
  cozy,
}

class Calendar extends StatefulWidget {
  const Calendar({
    required this.builder,
    required this.controller,
    required this.view,
    super.key,
  });
  final Widget Function(BuildContext, DateTime) builder;

  final ScrollController controller;

  final CalendarView view;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  static const _daysPerWeek = 7;

  late final DateTime _lastMonday;

  final UniqueKey _center = UniqueKey();

  @override
  void initState() {
    super.initState();
    final now = DateTime.now().rounded;
    _lastMonday = now.subtract(Duration(days: now.weekday - 1));
  }

  static const _minHeight = 80.0;
  static const _maxHeight = 120.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var minHeight = max(constraints.minHeight / 6, _minHeight);
        var maxHeight = _maxHeight;
        if (widget.view == CalendarView.compact) {
          minHeight /= 2;
          maxHeight /= 2;
        }
        final boxConstraints = BoxConstraints(
          minHeight: minHeight,
          maxHeight: min(
            maxHeight,
            max(constraints.maxHeight / 6, minHeight),
          ),
        ).normalize();
        return CustomScrollView(
          controller: widget.controller,
          anchor: 0.5,
          center: _center,
          slivers: [
            SliverList.builder(
              itemBuilder: (context, weekIndex) {
                final monday = _lastMonday.subtract(
                  Duration(
                    days: (weekIndex + 1) * _daysPerWeek,
                  ),
                );
                return _Week(
                  constraints: boxConstraints,
                  monday: monday,
                  builder: widget.builder,
                );
              },
            ),
            SliverToBoxAdapter(
              // This sliver will be located at the anchor. The scroll position
              // will progress in either direction from this point.
              key: _center,
              child: const SizedBox.shrink(),
            ),
            SliverList.builder(
              itemBuilder: (context, weekIndex) {
                final monday = _lastMonday.add(
                  Duration(
                    days: weekIndex * _daysPerWeek,
                  ),
                );
                return _Week(
                  constraints: boxConstraints,
                  monday: monday,
                  builder: widget.builder,
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _Week extends StatelessWidget {
  const _Week({
    required this.monday,
    required this.builder,
    required this.constraints,
  });

  final DateTime monday;
  final Widget Function(BuildContext, DateTime) builder;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final weekDays = List.generate(
      _CalendarState._daysPerWeek,
      (dayIndex) => monday.add(
        Duration(
          days: dayIndex,
        ),
      ),
    );

    final sunday = weekDays.last;
    final previousMonthDays = weekDays.where(
      (day) => day.month != sunday.month,
    );
    final nextMonthDays = weekDays.where(
      (day) => day.month == sunday.month,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (previousMonthDays.isNotEmpty)
          ConstrainedBox(
            constraints: constraints,
            child: Row(
              children: [
                ...previousMonthDays.map((day) {
                  return Expanded(child: builder(context, day));
                }),
                Spacer(
                  flex: _CalendarState._daysPerWeek - previousMonthDays.length,
                ),
              ],
            ),
          ),
        if (sunday.day <= 7)
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              MaterialLocalizations.of(context).formatMonthYear(sunday),
            ),
          ),
        ConstrainedBox(
          constraints: constraints,
          child: Row(
            children: [
              if (previousMonthDays.isNotEmpty)
                Spacer(
                  flex: _CalendarState._daysPerWeek - nextMonthDays.length,
                ),
              ...nextMonthDays.map((day) {
                return Expanded(child: builder(context, day));
              }),
            ],
          ),
        ),
      ],
    );
  }
}
