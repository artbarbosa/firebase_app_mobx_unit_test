import 'package:firebase_app_mobx/app/features/home/screens/pages/home_error.dart';
import 'package:firebase_app_mobx/app/features/home/screens/pages/home_loading.dart';
import 'package:firebase_app_mobx/app/features/home/screens/pages/home_page.dart';
import 'package:firebase_app_mobx/app/features/home/screens/stores/home_store.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.controller}) : super(key: key);
  final HomeStore controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, builder) {
        if (controller.isLoading) {
          return const HomeLoading();
        } else if (controller.hasError) {
          return HomeError(
            error: controller.error,
          );
        }
        return HomePage(
          controller: controller,
        );
      },
    );
  }
}
