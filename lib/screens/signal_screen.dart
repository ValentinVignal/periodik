import 'package:flutter/material.dart';

class SignalScreen extends StatelessWidget {
  const SignalScreen({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Coming soon...'),
      ),
    );
  }
}
