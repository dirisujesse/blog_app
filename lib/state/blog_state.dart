import 'dart:async';

import 'package:blog/services/http/blog/blog_contract.dart';
import 'package:blog/services/http/blog/blog_http_service.dart';
import 'package:blog/services/http/blog/blog_mock_http_service.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier, ValueNotifier;
import 'package:flutter/widgets.dart' show BuildContext, Navigator;

import 'package:blog/models/config/app_config.dart';
import 'package:blog/models/http/response/app_response_models.dart';
import 'package:blog/values/routes.dart';

class BlogState extends ChangeNotifier {
  static BlogState _instance;

  BlogService _service;

  ValueNotifier<Future<List<Blog>>> _blogsRef = ValueNotifier(null);
  ValueNotifier<Future<Blog>> _blogRef = ValueNotifier(null);
  Blog _selectedBlog;

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

  Blog get selectedBlog {
    return _selectedBlog;
  }

  ValueNotifier<Future<List<Blog>>> get blogsRef {
    if (_blogsRef == null || _blogsRef.value == null) {
      _blogsRef = ValueNotifier(_service.getBlogs());
    }
    return _blogsRef;
  }

  ValueNotifier<Future<Blog>> get blogRef {
    if (_blogRef == null || _blogRef.value == null) {
      _blogRef = ValueNotifier(
        _service.getBlogDetail(
          _selectedBlog?.id ?? "",
        ),
      );
    }
    return _blogRef;
  }

  getBlogDetail(Blog blog, {BuildContext context}) {
    _blogRef.value = _service.getBlogDetail(blog.id);
    _selectedBlog = blog;
    if (context != null) {
      Navigator.of(context).pushNamed(AppRoutes.blogDetail);
    }
  }

  getBlogs() {
    _blogsRef.value = _service.getBlogs();
    _selectedBlog = null;
  }
}
