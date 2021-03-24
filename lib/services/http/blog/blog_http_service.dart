import 'dart:async';

import 'package:blog/models/http/response/app_response_models.dart';
import 'package:blog/services/http/blog/blog_contract.dart';
import 'package:dio/dio.dart';
import 'package:blog/services/http/base_http.dart';
import 'package:blog/services/repository/repository_service.dart';

class BlogHttpService extends AppHttpService
    with CacheService
    implements BlogService {
  @override
  FutureOr<List<Blog>> getBlogs() async {
    List<Blog> data = [];
    try {
      final req = await http.get("/blogs");
      cacheResponse(req);
      req.data.forEach((it) => data.add(Blog.fromJson(Map.from(it))));
      return data;
    } on DioError catch (e) {
      try {
        final cacheData = await fetch(e);
        cacheData.forEach((it) => data.add(Blog.fromJson(Map.from(it))));
        return data;
      } catch (error) {
        throw error;
      }
    }
  }

  @override
  FutureOr<Blog> getBlogDetail(String id) async {
    if (id == null || id.isEmpty) return null;
    try {
      final req = await http.get("/blogs/$id");
      cacheResponse(req);
      return Blog.fromJson(Map.from(req.data));
    } on DioError catch (e) {
      try {
        final cacheData = await fetch(e);
        return Blog.fromJson(Map.from(cacheData));
      } catch (error) {
        throw error;
      }
    }
  }
}
