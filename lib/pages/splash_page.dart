import 'dart:async';

import 'package:flutter/material.dart';
import 'package:blog/components/fragments/avatars/app_logo.dart';
import 'package:blog/style/colors.dart';
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
      () => Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.blogs,
        (_) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Center(
        child: const AppLogo(
          key: Key("App_Logo"),
        ),
      ),
    );
  }
}
