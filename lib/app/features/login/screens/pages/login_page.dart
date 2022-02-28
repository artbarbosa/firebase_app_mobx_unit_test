import 'package:flutter/material.dart';
import 'package:firebase_app_mobx/app/features/login/screens/stores/login_store.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final LoginStore controller;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final double currentWidth = MediaQuery.of(context).size.width;
    final double currentHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SizedBox(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: currentWidth * 0.70,
                  height: currentHeight * 0.10,
                  child: TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'O campo Email não pode ser vazio';
                      }
                      return null;
                    },
                    onSaved: (text) {
                      controller.email = text!;
                    },
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                ),
                SizedBox(
                  width: currentWidth * 0.70,
                  height: currentHeight * 0.10,
                  child: TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'O campo Senha não pode ser vazio';
                      }
                      return null;
                    },
                    onSaved: (text) {
                      controller.password = text!;
                    },
                    decoration: const InputDecoration(hintText: 'Senha'),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize:
                          Size(currentWidth * 0.70, currentHeight * 0.10)),
                  child: const Text('Login'),
                  onPressed: () async {
                    if (_formKey.currentState?.validate() == true) {
                      _formKey.currentState?.save();
                      controller.loginWithEmailAndPassword(context);
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
