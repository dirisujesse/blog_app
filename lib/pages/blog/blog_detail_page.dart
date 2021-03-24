import 'package:blog/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:blog/components/fragments/state/app_empty_state.dart';
import 'package:blog/models/http/response/app_response_models.dart';
import 'package:blog/state/blog_state.dart';
import 'package:provider/provider.dart';

class BlogDetailPage extends StatelessWidget {
  const BlogDetailPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlogDetailView(),
    );
  }
}

class BlogDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<BlogState>();
    final scaler = context.scaler;

    return ValueListenableBuilder(
      valueListenable: model.selectedBlog,
      builder: (context, Blog blog, child) {
        return Container(
          height: scaler.sizer.height,
        );
      },
      child: Center(
        child: AppEmptyState(
          message: "No Blog Selected",
          subMessage:
              "To view details for a blog please select one from the sidebar",
        ),
      ),
    );
  }
}
