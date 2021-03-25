import 'package:blog/components/fragments/indicators/app_loader.dart';
import 'package:blog/components/fragments/spacers/app_sized_box.dart';
import 'package:blog/components/fragments/state/app_error_state.dart';
import 'package:blog/components/typography/app_text.dart';
import 'package:blog/style/colors.dart';
import 'package:blog/style/text_styles.dart';
import 'package:blog/utils/extensions.dart';
import 'package:blog/utils/helpers.dart';
import 'package:blog/utils/intl_formatter.dart';
import 'package:cached_network_image/cached_network_image.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          model?.selectedBlog?.title ?? "Blogs Page",
          style: AppTextStyle.black.copyWith(
            fontSize: 70,
          ),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: model.blogRef,
        builder: (context, Future<Blog> future, child) {
          return FutureBuilder(
            future: future,
            builder: (context, AsyncSnapshot<Blog> task) {
              if (task.connectionState == ConnectionState.waiting) return child;
              if (task.hasError) {
                return AppErrorState(
                  errorMessage: parseError(
                    task.error,
                    "Ooops an unexpected error occurred and blog details could not be fetched",
                  ),
                  onRetry: () {
                    model.getBlogDetail(model?.selectedBlog);
                  },
                );
              }
              if (!task.hasData) {
                return AppEmptyState(
                  message: "Blog details could not be fetched at this time",
                  subMessage: "Please refresh",
                  onRetry: () {
                    model.getBlogDetail(model?.selectedBlog);
                  },
                );
              }
              final data = task.data;
              return SingleChildScrollView(
                padding: scaler.insets.symmetric(
                  horizontal: 5,
                  vertical: 1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                          data?.imageUrl,
                        ),
                        backgroundColor: AppColors.black,
                        radius: scaler.fontSizer.sp(200),
                      ),
                    ),
                    AppSizedBox(height: 2),
                    AppText(
                      data?.title,
                      style: AppTextStyle.bold.copyWith(
                        fontSize: 50,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    AppText(
                      AppFormatter.formatDateMedium(data?.createdAt),
                      style: AppTextStyle.light.copyWith(
                        fontSize: 45,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Center(
          child: Apploader(),
        ),
      ),
    );
  }
}
