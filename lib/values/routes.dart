import 'package:blog/pages/auth/login_page.dart';
import 'package:blog/pages/blog/blog_detail_page.dart';
import 'package:blog/pages/blog/blog_home_page.dart';
import 'package:flutter/material.dart'
    show BuildContext, Widget, MaterialPageRoute, Route, RouteSettings;
import 'package:blog/pages/splash_page.dart';

class AppRoutes {
  static Widget home = SplashPage();

  /// Splash Routes
  static const splash = "/splash";

  /// Auth
  static const login = "/login";

  /// Blog Rutes
  static const blogs = "/blogs";
  static const blogDetail = "/blog/detail";

  static Map<String, Widget Function(BuildContext)> staticRoutes = {
    splash: (BuildContext context) => const SplashPage(),
    login: (BuildContext context) => const LoginPage(),
    blogs: (BuildContext context) => const BlogHomePage(),
    blogDetail: (BuildContext context) => const BlogDetailPage(),
  };

  static Route<dynamic> dynamicRoutes(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(
          builder: (context) {
            return SplashPage();
          },
        );
    }
  }
}
