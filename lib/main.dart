import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:blog/style/themedata.dart';
import 'package:blog/values/routes.dart';
import 'package:blog/values/state_wrapper.dart';

void main() {
  startApp();
}

void startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("app_data");
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(BlogApp());
}

class BlogApp extends StatelessWidget {
  const BlogApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateWrapper(
      child: MaterialApp(
        title: 'Blog App',
        home: AppRoutes.home,
        theme: AppThemes.defaultTheme,
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.staticRoutes,
        onGenerateRoute: AppRoutes.dynamicRoutes,
      ),
      isMock: false,
    );
  }
}
