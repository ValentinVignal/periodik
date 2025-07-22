import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:periodik/models/signal.dart';
import 'package:periodik/providers/signal_provider.dart';
import 'package:periodik/screens/signal/signal_screen_shell.dart';

void main() {
  testWidgets(
    'It should enable the delete button if the user enters the name of the signal',
    (tester) async {
      const signal = Signal(id: 'signalId', name: 'signalName');
      final widget = const DeleteSignalConfirmationDialog(id: 'signalId');
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            signalProvider(
              'signalId',
            ).overrideWith((_) => Stream.value(signal)),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: DeleteSignalConfirmationDialog(id: 'signalId'),
            ),
          ),
        ),
      );

      await tester.pump(); // Loads the signal.

      expect(find.text('Delete Signal?'), findsOne);
      expect(find.text('Type "signalName" to confirm'), findsOne);
      expect(find.widgetWithText(TextButton, 'Cancel'), findsOne);
      expect(find.widgetWithText(ElevatedButton, 'Delete'), findsOne);

      expect(
        tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed,
        isNull,
      );

      await tester.enterText(find.byType(TextField), 'signalName');
      await tester.pump();

      expect(
        tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed,
        isNotNull,
      );
    },
  );
}
