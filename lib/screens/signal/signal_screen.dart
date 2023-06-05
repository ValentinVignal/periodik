import 'package:flutter/material.dart';
import 'package:periodik/screens/signal/signal_calendar.dart';
import 'package:periodik/screens/signal/signal_list.dart';
import 'package:periodik/screens/signal/signal_screen_shell.dart';
import 'package:periodik/screens/signal/signal_view.dart';

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
    switch (view) {
      case SignalView.calendar:
        return SignalCalendar(
          id: id,
        );
      case SignalView.list:
        return SignalScreenShell(
          id: id,
          view: SignalView.list,
          child: SignalList(
            id: id,
          ),
        );
    }
  }
}
