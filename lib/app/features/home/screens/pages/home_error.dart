import 'package:firebase_app_mobx/app/core/widgets/po_error.dart';
import 'package:flutter/material.dart';

class HomeError extends StatelessWidget {
  const HomeError({Key? key, this.error}) : super(key: key);
  final String? error;
  @override
  Widget build(BuildContext context) {
    return PoError(error: error);
  }
}
