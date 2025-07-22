import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:mocktail/mocktail.dart';
import 'package:periodik/main.dart';
import 'package:periodik/screens/login_screen.dart';
import 'package:periodik/utils/auth.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class _MockFirebaseAuth extends Mock implements FirebaseAuth {}

class _MockUserCredential extends Mock implements UserCredential {}

class _MockGoogleSignInPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements GoogleSignInPlatform {}

void main() {
  setUpAll(() {
    registerFallbackValue(const InitParameters());
  });
  setUp(() {
    GoogleSignInPlatform.instance = _MockGoogleSignInPlatform();
  });
  testWidgets('It should display the login screen', (tester) async {
    Auth.mockInstance = _MockFirebaseAuth();
    when(Auth.instance.userChanges).thenAnswer((_) => const Stream.empty());
    when(GoogleSignInPlatform.instance.supportsAuthenticate).thenReturn(true);
    when(
      () => GoogleSignInPlatform.instance.init(any()),
    ).thenAnswer((_) async {});

    const widget = Periodik();
    await tester.pumpWidget(widget);

    expect(find.byType(LoginScreen), findsOneWidget);
    await expectLater(
      find.byWidget(widget),
      matchesGoldenFile('golden/login_screen.test.png'),
    );
  });

  testWidgets('It should login by sending a done text input action', (
    tester,
  ) async {
    Auth.mockInstance = _MockFirebaseAuth();
    when(Auth.instance.userChanges).thenAnswer((_) => const Stream.empty());
    when(
      () => Auth.instance.signInWithEmailAndPassword(
        email: 'login@email.com',
        password: 'password',
      ),
    ).thenAnswer((_) async => _MockUserCredential());
    when(GoogleSignInPlatform.instance.supportsAuthenticate).thenReturn(true);
    when(
      () => GoogleSignInPlatform.instance.init(any()),
    ).thenAnswer((_) async {});

    const widget = Periodik();
    await tester.pumpWidget(widget);

    expect(find.byType(LoginScreen), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).first, 'login@email.com');
    await tester.enterText(find.byType(TextFormField).last, 'password');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    verify(
      () => Auth.instance.signInWithEmailAndPassword(
        email: 'login@email.com',
        password: 'password',
      ),
    ).called(1);
  });
}
