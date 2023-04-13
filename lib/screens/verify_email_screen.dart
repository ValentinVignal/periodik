import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify your email'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text('Resend email'),
        ),
      ),
    );
  }
}
