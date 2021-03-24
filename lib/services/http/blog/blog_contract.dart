import 'dart:async';
import 'package:blog/models/http/response/app_response_models.dart';

abstract class BlogService {
  FutureOr<List<Blog>> getBlogs();
  FutureOr<Blog> getBlogDetail(String id);
}
