import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:periodik/main.dart';
import 'package:periodik/models/signal.dart';
import 'package:periodik/screens/signals_screen.dart';
import 'package:periodik/utils/auth.dart';
import 'package:periodik/utils/collections.dart';

class _MockFirebaseAuth extends Mock implements FirebaseAuth {}

class _MockUser extends Mock implements User {}

void main() {
  testWidgets('It should display the login screen', (tester) async {
    Auth.mockInstance = _MockFirebaseAuth();
    final user = _MockUser();
    when(Auth.instance.userChanges).thenAnswer((_) => Stream.value(user));
    when(() => Auth.instance.currentUser).thenReturn(user);
    when(() => user.emailVerified).thenReturn(true);
    when(() => user.uid).thenReturn('uid');

    Collections.mockInstance = FakeFirebaseFirestore();

    const signal0 = Signal(id: '0', name: 'signalName0');
    const signal1 = Signal(id: '1', name: 'signalName1');
    Collections.signals.doc(signal0.id).set(signal0.toJson());
    Collections.signals.doc(signal1.id).set(signal1.toJson());

    const widget = Periodik();
    await tester.pumpWidget(widget);
    await tester.pump();
    await tester.pump();

    expect(find.byType(SignalsScreen), findsOneWidget);
    await expectLater(
      find.byWidget(widget),
      matchesGoldenFile('golden/signals_screen.test.png'),
    );
  });
}
