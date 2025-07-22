import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'web_wrapper.dart' as web;

import '../../utils/auth.dart';

class GoogleSignInWidget extends StatefulWidget {
  const GoogleSignInWidget({super.key});

  @override
  State<GoogleSignInWidget> createState() => _GoogleSignInWidgetState();
}

class _GoogleSignInWidgetState extends State<GoogleSignInWidget> {
  var _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await GoogleSignIn.instance.initialize();
    setState(() {
      _isInitialized = true;
    });
    GoogleSignIn.instance.authenticationEvents.listen(
      _handleAuthenticationEvent,
    );
  }

  Future<void> _signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      await GoogleSignIn.instance.authenticate();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _handleAuthenticationEvent(
    GoogleSignInAuthenticationEvent event,
  ) async {
    final googleUser = switch (event) {
      GoogleSignInAuthenticationEventSignIn() => event.user,
      GoogleSignInAuthenticationEventSignOut() => null,
    };
    if (googleUser != null) {
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleUser.authentication.idToken,
      );

      // Once signed in, return the UserCredential
      await Auth.instance.signInWithCredential(credential);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (GoogleSignIn.instance.supportsAuthenticate()) {
      return IconButton(
        onPressed: _isInitialized ? _signInWithGoogle : null,
        icon: Builder(
          builder: (context) {
            final size = IconTheme.of(context).size;
            return SvgPicture.asset(
              'assets/icons/google.svg',
              height: size,
              width: size,
            );
          },
        ),
      );
    } else if (kIsWeb) {
      return web.renderButton();
    } else {
      return const SizedBox.shrink();
    }
  }
}
