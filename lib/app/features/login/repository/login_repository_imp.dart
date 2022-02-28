import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/error/failure.dart';
import '../model/user_model.dart';
import 'login_repository_interface.dart';

class LoginRepositoryImp implements ILoginRepository {
  final FirebaseAuth auth;

  LoginRepositoryImp({required this.auth});

  @override
  Future<UserModel> loginWithEmail(
      {required String email, required String password}) async {
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = result.user;
      if (user != null) {
        var userModel = UserModel(
          displayName: user.displayName!,
          email: user.email!,
          phoneNumber: user.phoneNumber!,
          photoURL: user.photoURL!,
        );
        return userModel;
      }
    } on FirebaseAuthException catch (e) {
      throw UnknownError(
        errorMessage: e.code,
        stackTrace: e.stackTrace,
        label: e.message,
      );
    }
    throw UnknownError();
  }

  @override
  Future<UserModel> loginWithPhone({required String phone}) async {
    try {
      var completer = Completer<AuthCredential>();
      await auth.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: const Duration(seconds: 30),
          verificationCompleted: (auth) {
            completer.complete(auth);
          },
          verificationFailed: (e) {
            completer.completeError(e);
          },
          codeSent: (String c, [int? i]) {
            completer.completeError((c));
          },
          codeAutoRetrievalTimeout: (v) {});
      var credential = await completer.future;
      var user = (await auth.signInWithCredential(credential)).user;
      if (user != null) {
        return UserModel(
          displayName: user.displayName!,
          email: user.email!,
          phoneNumber: user.phoneNumber!,
          photoURL: user.photoURL!,
        );
      }
    } on FirebaseAuthException catch (e) {
      throw UnknownError(
        errorMessage: e.code,
        stackTrace: e.stackTrace,
        label: e.message,
      );
    }
    throw UnknownError();
  }

  @override
  Future<UserModel> currentUser() async {
    try {
      var user = auth.currentUser;
      if (user != null) {
        return UserModel(
          displayName: user.displayName!,
          email: user.email!,
          phoneNumber: user.phoneNumber!,
          photoURL: user.photoURL!,
        );
      }
    } on FirebaseAuthException catch (e) {
      throw UnknownError(
        errorMessage: e.code,
        stackTrace: e.stackTrace,
        label: e.message,
      );
    }
    throw UnknownError();
  }

  @override
  Future<void> logout() async {
    return await auth.signOut();
  }
}
