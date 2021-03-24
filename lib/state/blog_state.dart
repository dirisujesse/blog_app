import 'dart:async';

import 'package:blog/services/http/blog/blog_contract.dart';
import 'package:blog/services/http/blog/blog_http_service.dart';
import 'package:blog/services/http/blog/blog_mock_http_service.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier, ValueNotifier;
import 'package:flutter/widgets.dart' show BuildContext, Navigator;

import 'package:blog/models/config/app_config.dart';
import 'package:blog/models/enums/screen_type.dart';
import 'package:blog/models/http/response/app_response_models.dart';
import 'package:blog/values/routes.dart';

class BlogState extends ChangeNotifier {
  static BlogState _instance;

  BlogService _service;

  ValueNotifier<Future<List<Blog>>> _blogsRef = ValueNotifier(null);
  ValueNotifier<Future<Blog>> _blogRef = ValueNotifier(null);
  ValueNotifier<Blog> _selectedBlog = ValueNotifier(null);

  void resetState() {
    _blogRef.value = null;
    _blogsRef.value = null;
  }

  BlogState() {
    _service = AppConfig.isMock ? BlogMockHttpService() : BlogHttpService();
  }

  static BlogState get instance {
    if (_instance == null) {
      _instance = BlogState();
    }
    return _instance;
  }

  ValueNotifier<Blog> get selectedBlog {
    return _selectedBlog;
  }

  ValueNotifier<Future<List<Blog>>> get blogsRef {
    if (_blogsRef == null || _blogsRef.value == null) {
      _blogsRef = ValueNotifier(_getBlogs());
    }
    return _blogsRef;
  }

  ValueNotifier<Future<Blog>> get blogRef {
    if (_blogRef == null || _blogRef.value == null) {
      _blogRef = ValueNotifier(_getBlog());
    }
    return _blogRef;
  }

  getBlogDetail(Blog blog, {BuildContext context, ScreenType screenType}) {
    _blogRef.value = _getBlog(id: blog.id);
    _selectedBlog.value = blog;
    Navigator.of(context).pushNamed(AppRoutes.blogDetail);
  }

  getBlogs({String query}) {
    _blogsRef.value = _getBlogs();
    _selectedBlog.value = null;
  }

  Future<List<Blog>> _getBlogs() async {
    try {
      final data = _service.getBlogs();
      return data;
    } catch (e) {
      throw e;
    }
  }

  Future<Blog> _getBlog({String id}) async {
    try {
      final data = _service.getBlogDetail(id);
      return data;
    } catch (e) {
      throw e;
    }
  }
}
