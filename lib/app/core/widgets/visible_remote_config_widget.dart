
import 'package:flutter/material.dart';

import '../services/remote/firebase_remote_config_service.dart';

class VisibleRemoteConfigWidget extends StatelessWidget {
  final Widget child;
  final String rmKey;
  final dynamic defaultValue;

  const VisibleRemoteConfigWidget({
    Key? key,
    required this.child,
    required this.rmKey,
    required this.defaultValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: child,
      visible: FirebaseRemoteConfigService().getValueOrDefault(
        key: rmKey,
        defaultValue: defaultValue,
      ),
    );
  }
}