import '../model/user_model.dart';

abstract class ILoginRepository {
  Future<UserModel> loginWithEmail({required String email, required String password});
  Future<UserModel> loginWithPhone({required String phone});
  Future<UserModel> currentUser();
  Future<void> logout();
}
