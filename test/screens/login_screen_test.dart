import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:periodik/main.dart';
import 'package:periodik/utils/auth.dart';

class _MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  testWidgets('It should display the login screen', (tester) async {
    Auth.mockInstance = _MockFirebaseAuth();
    when(Auth.mockInstance!.userChanges).thenAnswer(
      (_) => const Stream.empty(),
    );

    const widget = Periodik();
    await tester.pumpWidget(widget);

    await expectLater(
      find.byWidget(widget),
      matchesGoldenFile('golden/login_screen.test.png'),
    );
  });
}