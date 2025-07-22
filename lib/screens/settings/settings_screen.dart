import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/utils/collections.dart';

import '../../providers/settings_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider).valueOrNull;
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            title: const Text('Display predictions'),
            value: settings?.displayPredictions ?? false,
            onChanged: settings == null
                ? null
                : (value) {
                    Collections.settings.set(
                      settings.copyWith(displayPredictions: value).toJson(),
                    );
                  },
          ),
          SwitchListTile.adaptive(
            title: const Text('Display hidden signals'),
            value: settings?.displayHiddenSignals ?? false,
            onChanged: settings == null
                ? null
                : (value) {
                    Collections.settings.set(
                      settings.copyWith(displayHiddenSignals: value).toJson(),
                    );
                  },
          ),
        ],
      ),
    );
  }
}
