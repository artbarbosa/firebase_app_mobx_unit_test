import 'package:firebase_app_mobx/app/features/login/repository/login_repository_imp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyDh2bqcnJFk3dU5dBg3BydMRTSz2u3J2TQ',
    appId: '1:547571169078:web:30327e3b1ad00f9901a597',
    messagingSenderId: '547571169078',
    projectId: 'fir-app-test-bda35',
  ));

  final LoginRepositoryImp repository =
      LoginRepositoryImp(auth: FirebaseAuth.instance);
  var user = await repository.loginWithEmail(email: 'arthur.bos@hotmail.com', password: '123456');
  // ignore: avoid_print
  print(user.email);

  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
