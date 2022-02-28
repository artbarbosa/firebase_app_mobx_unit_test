import 'package:firebase_app_mobx/app/features/login/model/user_model.dart';
import 'package:firebase_app_mobx/app/features/login/repository/login_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/stores/auth_store.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final ILoginRepository repository;
  final AuthStore authStore;

  _LoginStoreBase({
    required this.authStore,
    required this.repository,
  });

  @observable
  bool _isLoading = false;

  @observable
  bool _hasError = false;

  @observable
  String error = '';

  @observable
  String email = "";

  @observable
  String password = "";

  @computed
  bool get hasError => error.isNotEmpty;

  @computed
  bool get isLoading => _isLoading;

  @action
  setIsLoading({bool value = false}) => _isLoading = value;

  @action
  setIsHasError({bool value = false}) => _hasError = value;

  @action
  setEmail(String value) => email = value;

  @action
  setPassword(String value) => password = value;

  loginWithEmailAndPassword(BuildContext context) async {
    UserModel user =
        await repository.loginWithEmail(email: email, password: password);
    authStore.setUser(user);
    Navigator.of(context).pushReplacementNamed('/home');
  }
}
