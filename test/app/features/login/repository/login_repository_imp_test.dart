import 'package:firebase_app_mobx/app/features/login/model/user_model.dart';
import 'package:firebase_app_mobx/app/features/login/repository/login_repository_imp.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late LoginRepositoryImp repository;
  late MockFirebaseAuth auth;
  var user = MockUser(
    isAnonymous: false,
    uid: 'someuid',
    email: 'art@somedomain.com',
    displayName: 'Arthur',
    phoneNumber: '513123123',
    photoURL: 'UrlPhonetest',
  );

  test('Should loginWithEmail return UserModel', () async {
    auth = MockFirebaseAuth(mockUser: user, signedIn: true);
    repository = LoginRepositoryImp(auth: auth);
    final result = await repository.loginWithEmail(email: '', password: '');
    expect(result, isA<UserModel>());
    expect(result.email, user.email);
    expect(user.isAnonymous, isFalse);
  });

  test('Should currentUser return UserModel', () async {
    auth = MockFirebaseAuth(mockUser: user, signedIn: true);
    repository = LoginRepositoryImp(auth: auth);
    final result = await repository.currentUser();
    expect(result, isA<UserModel>());
    expect(result.email, user.email);
    expect(user.isAnonymous, isFalse);
  });
    test('Should logout return null', () async {
    auth = MockFirebaseAuth(mockUser: user, signedIn: true);
    repository = LoginRepositoryImp(auth: auth);
    await repository.logout();
    expect(auth.currentUser, isNull);
  });
}
