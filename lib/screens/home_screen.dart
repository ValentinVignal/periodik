import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:periodik/models/signal.dart';
import 'package:periodik/providers/signals_provider.dart';
import 'package:periodik/utils/collections.dart';

final _logger = Logger('HomeScreen');

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
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
                  onTap: () {},
                  title: Text(signal.name),
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
        Collections.signals.add(
          const Signal(id: '', name: '').toJson(),
        );
        // TODO: Redirect to the signal screen.
      },
      child: const Icon(Icons.add),
    );
  }
}
