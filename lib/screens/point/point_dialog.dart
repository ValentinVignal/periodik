import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/models/point.dart';
import 'package:periodik/providers/points_provider.dart';
import 'package:periodik/utils/collections.dart';
import 'package:periodik/utils/date_time.dart';

class PointDialog extends ConsumerStatefulWidget {
  const PointDialog({super.key, required this.signalId, required this.point});

  final String signalId;

  final Point point;

  static Future<void> show({
    required BuildContext context,
    required String signalId,
    Point? point,
  }) async {
    await showDialog(
      context: context,
      builder: (context) => PointDialog(
        signalId: signalId,
        point: point ?? Point(id: '', date: DateTime.now()),
      ),
    );
  }

  @override
  ConsumerState<PointDialog> createState() => _PointDialogState();
}

class _PointDialogState extends ConsumerState<PointDialog> {
  late var _point = widget.point;
  @override
  Widget build(BuildContext context) {
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
                  initialDate: _point.date,
                  firstDate: _point.date.subtract(range),
                  lastDate: _point.date.add(range),
                  onDateSaved: (date) {
                    setState(() {
                      _point = _point.copyWith(date: date);
                    });
                  },
                ),
              ),
              IconButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _point.date,
                    firstDate: _point.date.subtract(range),
                    lastDate: _point.date.add(range),
                  );
                  if (date != null) {
                    setState(() {
                      _point = _point.copyWith(date: date);
                    });
                  }
                },
                icon: const Icon(Icons.calendar_today),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Checkbox(
                value: _point.state,
                onChanged: (value) {
                  setState(() {
                    _point = _point.copyWith(state: value!);
                  });
                },
              ),
              const Flexible(child: Text('State')),
            ],
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
            final points =
                ref.read(pointsProvider(widget.signalId)).asData?.value ??
                const [];
            if (points.any(
                  (otherPoint) =>
                      otherPoint.date.isSameDayAs(_point.date) &&
                      otherPoint.id != _point.id,
                ) &&
                mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Point already exists for date ${_point.date}'),
                ),
              );
              return;
            }
            if (_point.id.isEmpty) {
              await Collections.points(widget.signalId).add(_point.toJson());
            } else {
              await Collections.points(
                widget.signalId,
              ).doc(_point.id).update(_point.toJson());
            }
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
