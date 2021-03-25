import 'dart:async';

import 'package:blog/state/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:blog/components/fragments/avatars/app_logo.dart';
import 'package:blog/values/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage();

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    _routingHandler(context);
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null && timer.isActive) {
      timer.cancel();
    }
  }

  void _routingHandler(BuildContext context) {
    timer = Timer(
      Duration(seconds: 1),
      () {
        final isLoggedIn = SplashState?.instance?.isLoggedIn ?? false;
        Navigator.of(context).pushNamedAndRemoveUntil(
          isLoggedIn ? AppRoutes.blogs : AppRoutes.login,
          (_) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const AppLogo(
          key: Key("App_Logo"),
        ),
      ),
    );
  }
}
