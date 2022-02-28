import 'package:firebase_app_mobx/app/core/error/failure.dart';
import 'package:firebase_app_mobx/app/features/login/model/user_model.dart';
import 'package:firebase_app_mobx/app/features/login/repository/login_repository_imp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

class AuthCredentialMock extends Mock implements AuthCredential {}

class ConfirmationResultMock extends Mock implements ConfirmationResult {}

class UserMock extends Mock implements User {}

main() {
  final _auth = FirebaseAuthMock();
  final userCredential = UserCredentialMock();
  final confirmResult = ConfirmationResultMock();
  final _user = UserMock();
  final userModel = UserModel(
    photoURL: 'http://photoUrl123',
    displayName: "Arthur",
    phoneNumber: "123456",
    email: "arthur.bos@hotmail.com",
  );
  final repository = LoginRepositoryImp(auth: _auth);

  setUpAll(() {
    when(_auth.signInWithEmailAndPassword(email: 'email', password: 'password'))
        .thenAnswer((_)  async => userCredential);

    when(userCredential.user).thenAnswer((_) => _user);

    when(_user.displayName).thenReturn('Arthur');
    when(_user.photoURL).thenReturn('http://photoUrl123');
    when(_user.phoneNumber).thenReturn('123456');
    when(_user.email).thenReturn('arthur.bos@hotmail.com');

    when(_auth.signInWithPhoneNumber('123456'))
        .thenAnswer((_) async => confirmResult);
  });

  test('should return Logged User  loginWithEmail', () async {
    final userFirebase =
        await repository.loginWithEmail(email: 'email', password: 'password');
    expect(userFirebase.displayName, equals(userModel.displayName));
    expect(userFirebase.email, equals(userModel.email));
    expect(userFirebase.phoneNumber, equals(userModel.phoneNumber));
    expect(userFirebase.photoURL, equals(userModel.photoURL));
  });

  test('should return Logged User  loginWithPhone', () async {
    var result = await repository.loginWithPhone(phone: '0');
    expect(result.displayName, equals(userModel.displayName));
    expect(result.email, equals(userModel.email));
    expect(result.phoneNumber, equals(userModel.phoneNumber));
    expect(result.photoURL, equals(userModel.photoURL));
  });
  test('should return FirebaseUser loginPhone Error', () async {
    expect(() async => await repository.loginWithPhone(phone: "1"),
        throwsA('authException'));
  });
  test('should return NotAutomaticRetrieved loginPhone Not Automatic Retrieve',
      () async {
    expect(() async => await repository.loginWithPhone(phone: "3"),
        throwsA(isA()));
  });
  test('should return Logged User', () async {
    var result = await repository.currentUser();
    expect(result.displayName, equals(userModel.displayName));
    expect(result.email, equals(userModel.email));
    expect(result.phoneNumber, equals(userModel.phoneNumber));
    expect(result.photoURL, equals(userModel.photoURL));
  });

  test('should return UnknownError if User is not logged', () async {
    when(_auth.currentUser).thenThrow((_) async => null);
    expect(repository.currentUser(), throwsA(isA<UnknownError>()));
  });

  test('should complete logout', () async {
    when(_auth.signOut()).thenAnswer((_) async {});
    expect(repository.logout(), completes);
  });

  test('should return error', () async {
    when(_auth.signOut()).thenThrow(Exception());
    expect(repository.logout(), throwsA(isA<Exception>()));
  });
}
