import 'package:blog/components/fragments/buttons/logout_button.dart';
import 'package:blog/components/fragments/indicators/app_loader.dart';
import 'package:blog/components/fragments/spacers/app_sized_box.dart';
import 'package:blog/components/fragments/state/app_empty_state.dart';
import 'package:blog/components/fragments/state/app_error_state.dart';
import 'package:blog/components/typography/app_text.dart';
import 'package:blog/models/http/response/app_response_models.dart';
import 'package:blog/state/blog_state.dart';
import 'package:blog/style/colors.dart';
import 'package:blog/style/text_styles.dart';
import 'package:blog/utils/helpers.dart';
import 'package:blog/utils/intl_formatter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class BlogHomePage extends StatelessWidget {
  const BlogHomePage();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<BlogState>();

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          "Blogs Page",
          style: AppTextStyle.black.copyWith(
            fontSize: 70,
          ),
        ),
        actions: [
          LogoutButton()
        ],
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: model.blogsRef,
        builder: (context, Future<List<Blog>> future, child) {
          return FutureBuilder(
            future: future,
            builder: (context, AsyncSnapshot<List<Blog>> task) {
              if (task.connectionState == ConnectionState.waiting) return child;
              if (task.hasError) {
                return AppErrorState(
                  errorMessage: parseError(
                    task.error,
                    "Ooops an unexpected error occurred and blogs could not be fetched",
                  ),
                  onRetry: () {
                    model.getBlogs();
                  },
                );
              }
              if (!task.hasData || (task?.data?.isEmpty ?? true)) {
                return AppEmptyState(
                  message: "No blogs were found at this time",
                  subMessage: "Please refresh",
                  onRetry: () {
                    model.getBlogs();
                  },
                );
              }
              final data = task.data;
              return RefreshIndicator(
                child: ListView.separated(
                  itemCount: data?.length ?? 0,
                  separatorBuilder: (_, __) {
                    return AppSizedBox(height: 1);
                  },
                  itemBuilder: (_, idx) {
                    final blog = data[idx];
                    return ListTile(
                      onTap: () {
                        model.getBlogDetail(blog, context: context);
                      },
                      dense: true,
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                          blog?.imageUrl,
                        ),
                        backgroundColor: AppColors.black,
                      ),
                      title: AppText(
                        AppFormatter.capitalise(blog?.title ?? ""),
                        style: AppTextStyle.black.copyWith(
                          fontSize: 60,
                        ),
                      ),
                      subtitle: AppText(
                        AppFormatter.formatDateMedium(blog?.createdAt ?? ""),
                        style: AppTextStyle.light.copyWith(
                          fontSize: 50,
                        ),
                      ),
                    );
                  },
                ),
                onRefresh: () async {
                  model.getBlogs();
                },
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
