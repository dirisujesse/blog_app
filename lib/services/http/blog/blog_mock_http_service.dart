import 'dart:async';

import 'package:blog/services/http/blog/blog_contract.dart';
import 'package:blog/models/http/response/app_response_models.dart';
import 'package:blog/values/json.dart';

class BlogMockHttpService implements BlogService {
  @override
  FutureOr<List<Blog>> getBlogs() async {
    List<Blog> data = [];
    try {
      final response = mockBlogData;
      response.forEach((it) => data.add(Blog.fromJson(Map.from(it))));
      return data;
    } catch (e) {
      throw e;
    }
  }

  @override
  FutureOr<Blog> getBlogDetail(String id) async {
    if (id == null || id.isEmpty) return null;
    try {
      final response = mockBlogData.firstWhere(
        (it) => it["id"] == id,
        orElse: () => null,
      );
      if (response == null) return null;
      return Blog.fromJson(Map.from(response));
    } catch (e) {
      throw e;
    }
  }
}
