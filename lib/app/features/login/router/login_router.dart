import 'package:firebase_app_mobx/app/core/stores/auth_store.dart';
import 'package:firebase_app_mobx/app/features/login/repository/login_repository_interface.dart';
import 'package:firebase_app_mobx/app/features/login/screens/stores/login_store.dart';
import 'package:flutter/material.dart';

import '../screens/containers/login_container.dart';

class LoginRouter extends StatelessWidget {
  const LoginRouter(
      {Key? key, required this.repository, required this.authStore})
      : super(key: key);
  final ILoginRepository repository;
  final AuthStore authStore;
  
  @override
  Widget build(BuildContext context) {
    return LoginContainer(
      controller: LoginStore(
        authStore: authStore,
        repository: repository,
      ),
    );
  }
}
