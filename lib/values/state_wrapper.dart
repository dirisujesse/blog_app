import 'package:blog/state/auth_state.dart';
import 'package:blog/state/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:blog/models/config/app_config.dart';
import 'package:blog/state/blog_state.dart';
import 'package:provider/provider.dart';

class StateWrapper extends StatelessWidget {
  final Widget child;

  StateWrapper({
    @required this.child,
    bool isMock = true,
  }) {
    AppConfig.init(isMock: isMock);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(
        create: (_) => BlogState.instance,
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (_) => SplashState.instance,
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (_) => AuthState.instance,
        lazy: true,
      ),
    ],
      child: child,
    );
  }
}
