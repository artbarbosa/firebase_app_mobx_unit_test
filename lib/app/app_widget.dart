
import 'package:firebase_app_mobx/app/core/routers/routers.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routers.initialRoute,
      onGenerateRoute: Routers.generateRoutes,
    );
  }
}
