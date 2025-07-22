import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:periodik/models/point_state.dart';
import 'package:periodik/models/signal.dart';
import 'package:periodik/providers/signals_provider.dart';
import 'package:periodik/router/routes.dart';
import 'package:periodik/utils/collections.dart';
import 'package:periodik/widgets/signal_name_widget.dart';

import '../providers/points_provider.dart';
import '../providers/settings_provider.dart';
import '../utils/auth.dart';

final _logger = Logger('HomeScreen');

enum _SignalsAction { settings, logout }

class SignalsScreen extends ConsumerWidget {
  const SignalsScreen({super.key});

  Future<void> _onAction(
    BuildContext context,
    WidgetRef ref,
    _SignalsAction action,
  ) async {
    switch (action) {
      case _SignalsAction.settings:
        GoRouter.of(context).push(const SettingsRoute().location);
      case _SignalsAction.logout:
        await Auth.instance.signOut();
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          PopupMenuButton<_SignalsAction>(
            onSelected: (action) => _onAction(context, ref, action),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: _SignalsAction.settings,
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
              ),
              const PopupMenuItem(
                value: _SignalsAction.logout,
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                ),
              ),
            ],
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
    return ref
        .watch(signalsProvider)
        .when(
          data: (signals) {
            return ListView.builder(
              itemCount: signals.length,
              itemBuilder: (context, index) {
                final signal = signals[index];
                return Consumer(
                  builder: (context, ref, child) {
                    var state = PointState.none;
                    if (ref
                            .watch(settingsProvider)
                            .valueOrNull
                            ?.displayPredictions ??
                        false) {
                      state =
                          ref
                              .watch(estimatedCyclesProvider(signal.id))
                              .value
                              ?.estimate(DateTime.now()) ??
                          PointState.none;
                    }
                    return ListTile(
                      tileColor: state.containerColor(Theme.of(context)),
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).go(SignalRoute(id: signal.id).location);
                      },
                      title: SignalNameWidget(signal: signal),
                    );
                  },
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
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
          GoRouter.of(
            context,
          ).go(SignalRoute(id: documentReference.id).location);
        }
      },
      child: const Icon(Icons.add),
    );
  }
}
