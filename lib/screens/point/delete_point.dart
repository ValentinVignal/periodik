import 'package:flutter/material.dart';
import 'package:periodik/utils/collections.dart';

Future<void> deletePoint({
  required BuildContext context,
  required String signalId,
  required String pointId,
}) async {
  final delete = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Delete point?'),
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
    await Collections.points(signalId).doc(pointId).delete();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Deleted')),
      );
    }
  }
}
