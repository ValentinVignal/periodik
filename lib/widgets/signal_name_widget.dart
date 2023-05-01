import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:periodik/models/signal.dart';

class SignalNameWidget extends StatelessWidget {
  const SignalNameWidget({
    required this.signal,
    super.key,
  });

  final Signal? signal;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context);
    return Hero(
      tag: _SignalNameHeroTag(signal?.id),
      child: Material(
        color: Colors.transparent,
        child: AnimatedDefaultTextStyle(
          style: defaultTextStyle.style,
          duration: const Duration(milliseconds: 250),
          child: Text(
            signal?.name ?? '',
          ),
        ),
      ),
    );
  }
}

class _SignalNameHeroTag with EquatableMixin {
  const _SignalNameHeroTag(this.id);

  final String? id;

  @override
  List<Object?> get props => [id];
}
