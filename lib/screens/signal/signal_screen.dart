import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:periodik/providers/signal_provider.dart';
import 'package:periodik/router/routes.dart';
import 'package:periodik/screens/point/point_dialog.dart';
import 'package:periodik/screens/signal/signal_calendar.dart';
import 'package:periodik/screens/signal/signal_list.dart';
import 'package:periodik/screens/signal/signal_view.dart';
import 'package:periodik/utils/collections.dart';
import 'package:periodik/utils/hero_tag.dart';
import 'package:periodik/widgets/signal_name_widget.dart';

enum _SignalAction {
  delete,
}

class SignalScreen extends StatelessWidget {
  const SignalScreen({
    required this.id,
    this.view = SignalView.calendar,
    super.key,
  });

  final String id;

  final SignalView view;

  Future<void> _onAction(BuildContext context, _SignalAction action) async {
    switch (action) {
      case _SignalAction.delete:
        final delete = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Delete Signal?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('Delete'),
                  ),
                ],
              ),
            ) ??
            false;
        if (delete) {
          await Collections.signals.doc(id).delete();
          if (context.mounted) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Deleted')));
            GoRouter.of(context).pop();
          }
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _SignalAppBar(
          id: id,
        ),
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).go(
                SignalRoute(
                  id: id,
                  view: view == SignalView.calendar
                      ? SignalView.list
                      : SignalView.calendar,
                ).location,
              );
            },
            icon: Icon(
              view == SignalView.calendar ? Icons.list : Icons.calendar_month,
            ),
          ),
          PopupMenuButton(
            onSelected: (action) => _onAction(context, action),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: _SignalAction.delete,
                child: Text('Delete'),
              ),
            ],
          ),
        ],
      ),
      body: view == SignalView.calendar
          ? FractionallySizedBox(
              heightFactor: 0.8,
              child: SignalCalendar(
                id: id,
              ),
            )
          : SignalList(
              id: id,
            ),
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
    return SignalNameWidget(
      signal: ref.watch(signalProvider(id)).asData?.value,
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
      context: context,
      builder: (context) => _EditSignalDialog(id: id),
    );
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
          onPressed: () => PointDialog.show(context: context, signalId: id),
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
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: ref.read(signalProvider(widget.id)).asData?.value.name,
    );
  }

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
