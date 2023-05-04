import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:periodik/models/signal.dart';
import 'package:periodik/providers/signals_provider.dart';
import 'package:periodik/router/routes.dart';
import 'package:periodik/utils/collections.dart';
import 'package:periodik/widgets/signal_name_widget.dart';

final _logger = Logger('HomeScreen');

class SignalsScreen extends StatelessWidget {
  const SignalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signals'),
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).go(const SignalsCalendarRoute().location);
            },
            icon: const Icon(Icons.calendar_month),
          ),
          IconButton(
            onPressed: FirebaseAuth.instance.signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const _Signals(),
      floatingActionButton: const _FloatingActionButton(),
    );
  }
}

class _Signals extends ConsumerWidget {
  const _Signals();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(signalsProvider).when(
          data: (signals) {
            return ListView.builder(
              itemCount: signals.length,
              itemBuilder: (context, index) {
                final signal = signals[index];
                return ListTile(
                  onTap: () {
                    GoRouter.of(context).go(
                      SignalRoute(id: signal.id).location,
                    );
                  },
                  title: SignalNameWidget(
                    signal: signal,
                  ),
                );
              },
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) {
            _logger.severe('Could not display the signals', error, stack);
            return Center(
              child: Text(
                'Error',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            );
          },
        );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final documentReference = await Collections.signals.add(
          const Signal(id: '', name: '').toJson(),
        );
        if (context.mounted) {
          GoRouter.of(context).go(
            SignalRoute(id: documentReference.id).location,
          );
        }
      },
      child: const Icon(Icons.add),
    );
  }
}
