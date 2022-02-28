import 'package:firebase_app_mobx/app/core/stores/auth_store.dart';
import 'package:firebase_app_mobx/app/features/home/router/home_router.dart';
import 'package:firebase_app_mobx/app/features/login/repository/login_repository_imp.dart';
import 'package:firebase_app_mobx/app/features/login/router/login_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Routers {
  static String get initialRoute => '/login';

  static Map<String, Widget Function(BuildContext, dynamic)> routes = {
    '/login': (_, args) => LoginRouter(
          authStore: AuthStore(),
          repository: LoginRepositoryImp(
            auth: FirebaseAuth.instance,
          ),
        ),
    '/home': (_, args) => HomeRouter(
          authStore: AuthStore(),
          repository: LoginRepositoryImp(
            auth: FirebaseAuth.instance,
          ),
        )
  };

  static Route? generateRoutes(RouteSettings settings) {
    final routerName = settings.name;
    final routerArgs = settings.arguments;

    final navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}
