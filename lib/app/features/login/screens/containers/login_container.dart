import 'package:firebase_app_mobx/app/features/login/screens/pages/login_error.dart';
import 'package:firebase_app_mobx/app/features/login/screens/pages/login_loading.dart';
import 'package:firebase_app_mobx/app/features/login/screens/stores/login_store.dart';
import 'package:flutter/material.dart';
import '../pages/login_page.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({Key? key, required this.controller}) : super(key: key);
  final LoginStore controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, builder) {
        if (controller.isLoading) {
          return const LoginLoading();
        } else if (controller.hasError) {
          return LoginError(
            error: controller.error,
          );
        }
        return LoginPage(
          controller: controller,
        );
      },
    );
  }
}
