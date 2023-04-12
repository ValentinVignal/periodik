import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:periodik/router/routes.dart';
import 'package:periodik/utils/iterable_extension.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const _LoginScreenContent(),
    );
  }
}

class _LoginScreenContent extends StatefulWidget {
  const _LoginScreenContent();

  @override
  State<_LoginScreenContent> createState() => __LoginScreenContentState();
}

class __LoginScreenContentState extends State<_LoginScreenContent> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _obscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            decoration: const InputDecoration(label: Text('Email')),
            controller: _emailController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(label: Text('Password')),
                  controller: _passwordController,
                  obscureText: _obscure,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
                icon: Icon(
                  _obscure ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ],
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Login'),
          ),
        ),
        Center(
          child: TextButton(
            onPressed: () {
              GoRouter.of(context).go(const SignUpRoute().location);
            },
            child: const Text('Sign Up'),
          ),
        ),
      ].separated(const SizedBox(height: 8)).toList(),
    );
  }
}
