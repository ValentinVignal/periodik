import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:periodik/router/routes.dart';
import 'package:periodik/utils/iterable_extension.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
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
  final _emailController = TextEditingController();
  final _passwordController0 = TextEditingController();
  final _passwordController1 = TextEditingController();
  var _obscure0 = true;
  var _obscure1 = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController0.dispose();
    _passwordController1.dispose();
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
                  controller: _passwordController0,
                  obscureText: _obscure0,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _obscure0 = !_obscure0;
                  });
                },
                icon: Icon(
                  _obscure0 ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(label: Text('Password')),
                  controller: _passwordController1,
                  obscureText: _obscure1,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _obscure1 = !_obscure1;
                  });
                },
                icon: Icon(
                  _obscure1 ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ],
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {},
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
    );
  }
}
