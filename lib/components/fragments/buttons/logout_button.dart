import 'package:blog/state/auth_state.dart';
import 'package:blog/values/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    return IconButton(
      icon: Icon(Icons.power_settings_new_rounded),
      onPressed: () async {
        await model.logout();
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.login,
          (route) => false,
        );
      },
    );
  }
}
