import 'package:mobx/mobx.dart';

import '../../../../core/stores/auth_store.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final AuthStore authStore;

  _HomeStoreBase({
    required this.authStore,
  });

  @observable
  bool _isLoading = false;

  @observable
  bool _hasError = false;

  @observable
  String error = '';

  @computed
  bool get hasError => error.isNotEmpty;

  @computed
  bool get isLoading => _isLoading;

  @action
  setIsLoading({bool value = false}) => _isLoading = value;

  @action
  setIsHasError({bool value = false}) => _hasError = value;
}
