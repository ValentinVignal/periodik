import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/models/point.dart';
import 'package:periodik/providers/points_provider.dart';
import 'package:periodik/providers/signal_provider.dart';
import 'package:periodik/utils/collections.dart';
import 'package:periodik/utils/hero_tag.dart';

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
      body: _SignalContent(
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
      context: context,
      builder: (context) => _EditSignalDialog(id: id),
    );
  }

  void _onAdd(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _AddPointDialog(id: id),
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
          onPressed: () => _onAdd(context),
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

class _AddPointDialog extends StatefulWidget {
  const _AddPointDialog({
    required this.id,
  });

  final String id;

  @override
  State<_AddPointDialog> createState() => _AddPointDialogState();
}

class _AddPointDialogState extends State<_AddPointDialog> {
  var _state = false;
  var _date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    const range = Duration(days: 100);
    return AlertDialog(
      title: const Text('New point'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: InputDatePickerFormField(
                  initialDate: _date,
                  firstDate: now.subtract(range),
                  lastDate: now.add(range),
                  onDateSaved: (date) {
                    setState(() {
                      _date = date;
                    });
                  },
                ),
              ),
              IconButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: now,
                    firstDate: now.subtract(range),
                    lastDate: now.add(range),
                  );
                  if (date != null) {
                    setState(() {
                      _date = date;
                    });
                  }
                },
                icon: const Icon(Icons.calendar_today),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Checkbox(
            value: _state,
            onChanged: (value) {
              setState(() {
                _state = value!;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            await Collections.points(widget.id).add(Point(
              id: '',
              date: _date,
              state: _state,
            ).toJson());
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}

class _SignalContent extends ConsumerWidget {
  const _SignalContent({
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final points = ref.watch(pointsProvider(id)).asData?.value ?? const [];
    return ListView.builder(
      itemCount: points.length,
      itemBuilder: (context, index) {
        final point = points[index];
        return ListTile(
          title: Text(point.date.toString()),
          subtitle: Text(point.state.toString()),
        );
      },
    );
  }
}
