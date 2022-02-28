import 'package:firebase_app_mobx/app/features/login/model/user_model.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  _AuthStoreBase();

  @observable
  late UserModel userModel;

  @computed
  bool get isLogged => userModel != null;

  @action
  void setUser(UserModel value) => userModel = value;

   Future<bool> checkLogin() async {
     return  isLogged;
   }

}