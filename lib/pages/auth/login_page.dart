import 'package:blog/state/auth_state.dart';
import 'package:blog/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    final model = context.watch<AuthState>();

    print(model.hashCode);

    return Scaffold(
      body: Container(
        height: scaler.sizer.height,
      ),
    );
  }
}
