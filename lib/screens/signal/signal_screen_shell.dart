import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:periodik/providers/signal_provider.dart';
import 'package:periodik/router/routes.dart';
import 'package:periodik/screens/point/point_dialog.dart';
import 'package:periodik/screens/signal/signal_view.dart';
import 'package:periodik/utils/collections.dart';
import 'package:periodik/widgets/signal_name_widget.dart';

enum _SignalAction {
  edit,
  delete,
}

class SignalScreenShell extends StatelessWidget {
  const SignalScreenShell({
    required this.id,
    required this.child,
    this.view = SignalView.calendar,
    this.floatingActionButton,
    super.key,
  });

  final String id;

  final Widget child;

  final SignalView view;

  final Widget? floatingActionButton;

  Future<void> _onAction(BuildContext context, _SignalAction action) async {
    switch (action) {
      case _SignalAction.edit:
        return showDialog(
          context: context,
          builder: (context) => _EditSignalDialog(id: id),
        );
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
                view == SignalView.calendar
                    ? SignalListRoute(id: id).location
                    : SignalCalendarRoute(id: id).location,
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
                value: _SignalAction.edit,
                child: Text('Edit'),
              ),
              const PopupMenuItem(
                value: _SignalAction.delete,
                child: Text('Delete'),
              ),
            ],
          ),
        ],
      ),
      body: child,
      floatingActionButton: _FAB(
        id: id,
        floatingActionButton: floatingActionButton,
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
    this.floatingActionButton,
  });

  final String id;

  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    final addButton = FloatingActionButton(
      onPressed: () => PointDialog.show(context: context, signalId: id),
      child: const Icon(Icons.add),
    );
    if (floatingActionButton == null) return addButton;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        floatingActionButton!,
        const SizedBox(width: 8),
        addButton,
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
