import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/providers/points_provider.dart';
import 'package:periodik/screens/point/point_dialog.dart';

class SignalList extends ConsumerWidget {
  const SignalList({
    super.key,
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
          onTap: () {
            PointDialog.show(
              context: context,
              signalId: id,
              point: point,
            );
          },
          trailing: point.state
              ? Icon(
                  Icons.circle,
                  color: Theme.of(context).colorScheme.error,
                )
              : null,
          title: Text(point.date.toString()),
          subtitle: Text(point.state.toString()),
        );
      },
    );
  }
}
