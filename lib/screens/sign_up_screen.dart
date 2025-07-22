import 'package:animated_collection/animated_collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

import '../router/routes.dart';
import '../utils/auth.dart';
import '../utils/iterable_extension.dart';

final _logger = Logger('SignUpScreen');

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: const _SignUpScreenContent(),
    );
  }
}

class _SignUpScreenContent extends StatefulWidget {
  const _SignUpScreenContent();

  @override
  State<_SignUpScreenContent> createState() => _SignUpScreenContentState();
}

class _SignUpScreenContentState extends State<_SignUpScreenContent> {
  late final _emailController = TextEditingController();
  late final _passwordController0 = TextEditingController();
  late final _passwordController1 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _obscure0 = true;
  var _obscure1 = true;

  var _error = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController0.dispose();
    _passwordController1.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    setState(() {
      _error = '';
    });
    if (!_formKey.currentState!.validate()) return;
    try {
      await Auth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController0.text,
      );
      final user = Auth.instance.currentUser!;

      if (user.emailVerified) {
        // Go router should refresh the page.
      } else {
        await user.sendEmailVerification();
        if (mounted) {
          GoRouter.of(context).go(const VerifyEmailRoute().location);
        }
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _error = e.message ?? 'Unknown error';
      });
    } catch (error, stackTrace) {
      _logger.severe('Could not sign up', error, stackTrace);
      setState(() {
        _error = 'Unknown error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              decoration: const InputDecoration(label: Text('Email')),
              controller: _emailController,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Mandatory field';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              decoration: InputDecoration(
                label: const Text('Password'),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscure0 = !_obscure0;
                    });
                  },
                  icon: Icon(
                    _obscure0 ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              controller: _passwordController0,
              obscureText: _obscure0,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Mandatory field';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              decoration: InputDecoration(
                label: const Text('Password'),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscure1 = !_obscure1;
                    });
                  },
                  icon: Icon(
                    _obscure1 ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              controller: _passwordController1,
              obscureText: _obscure1,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Mandatory field';
                }
                if (value != _passwordController0.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
          ),
          AnimatedVisibility(
            visible: _error.isNotEmpty,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  _error,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: _signUp,
              child: const Text('Sign up'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                GoRouter.of(context).go(const LoginRoute().location);
              },
              child: const Text('Login'),
            ),
          ),
        ].separated(const SizedBox(height: 8)).toList(),
      ),
    );
  }
}
