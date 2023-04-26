import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/providers/signal_provider.dart';
import 'package:periodik/utils/collections.dart';
import 'package:periodik/utils/hero_tag.dart';
import 'package:periodik/widgets/calendar/calendar.dart';

class SignalScreen extends StatelessWidget {
  const SignalScreen({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _SignalAppBar(
          id: id,
        ),
      ),
      body: const Calendar(),
      floatingActionButton: _FAB(
        id: id,
      ),
    );
  }
}

class _SignalAppBar extends ConsumerWidget {
  const _SignalAppBar({
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      ref.watch(signalProvider(id)).asData?.value.name ?? '',
    );
  }
}

class _FAB extends StatelessWidget {
  const _FAB({
    required this.id,
  });

  final String id;

  void _onEdit(BuildContext context) {
    showDialog(
        context: context, builder: (context) => _EditSignalDialog(id: id));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: const EditHeroTag(),
          onPressed: () => _onEdit(context),
          child: const Icon(Icons.edit),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class _EditSignalDialog extends ConsumerStatefulWidget {
  const _EditSignalDialog({
    required this.id,
  });

  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __EditSignalDialogState();
}

class __EditSignalDialogState extends ConsumerState<_EditSignalDialog> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Signal'),
      content: TextFormField(
        controller: _textController,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            await Collections.signals.doc(widget.id).update({
              'name': _textController.text,
            });
            if (mounted) {
              Navigator.of(context).pop();
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
