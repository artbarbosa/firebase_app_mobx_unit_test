import 'package:firebase_app_mobx/app/core/stores/auth_store.dart';
import 'package:firebase_app_mobx/app/features/home/screens/containers/home_container.dart';
import 'package:firebase_app_mobx/app/features/home/screens/stores/home_store.dart';
import 'package:firebase_app_mobx/app/features/login/repository/login_repository_interface.dart';
import 'package:flutter/material.dart';


class HomeRouter extends StatelessWidget {
  const HomeRouter(
      {Key? key, required this.repository, required this.authStore})
      : super(key: key);
  final ILoginRepository repository;
  final AuthStore authStore;
  
  @override
  Widget build(BuildContext context) {
    return HomeContainer(
      controller: HomeStore(
        authStore: authStore
      ),
    );
  }
}
