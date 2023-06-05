import 'dart:math';

import 'package:flutter/material.dart';
import 'package:periodik/utils/date_time.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

enum CalendarView {
  compact,
  cozy,
}

class CalendarController {
  CalendarController();

  ItemScrollController? _pageController;

  void _initialize(ItemScrollController pageController) {
    _pageController = pageController;
  }

  void _dispose() {
    _pageController = null;
  }

  Future<void> resetView() {
    assert(_pageController != null);
    return _pageController!.scrollTo(
      index: _CalendarState._initialWeekIndex,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }
}

class Calendar extends StatefulWidget {
  const Calendar({
    required this.builder,
    required this.controller,
    required this.view,
    super.key,
  });
  final Widget Function(BuildContext, DateTime) builder;

  final CalendarController controller;

  final CalendarView view;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final _itemScrollController = ItemScrollController();

  static const _initialWeekIndex = 100;

  static const _daysPerWeek = 7;

  late final DateTime _firstCalendarDay;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now().rounded;
    final lastMonday = now.subtract(Duration(days: now.weekday - 1));
    _firstCalendarDay = lastMonday
        .subtract(
          const Duration(
            days: _daysPerWeek * _initialWeekIndex,
          ),
        )
        // So the current day is kind of in the middle of the screen.
        .subtract(
          const Duration(days: _daysPerWeek * 3),
        );

    widget.controller._initialize(_itemScrollController);
  }

  @override
  void dispose() {
    widget.controller._dispose();
    super.dispose();
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
        return ScrollablePositionedList.builder(
          itemCount: _initialWeekIndex * 2,
          initialScrollIndex: _initialWeekIndex,
          itemScrollController: _itemScrollController,
          itemBuilder: (context, weekIndex) {
            final monday = _firstCalendarDay.add(
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
