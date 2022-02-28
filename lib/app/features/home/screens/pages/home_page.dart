import 'package:firebase_app_mobx/app/features/home/screens/stores/home_store.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.controller}) : super(key: key);
  final HomeStore controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Logged!"),
        const SizedBox(height: 10),
        Text("email: ${controller.authStore.userModel.email}"),
      ],
    );
  }
}
