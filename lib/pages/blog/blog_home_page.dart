import 'package:blog/state/blog_state.dart';
import 'package:blog/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class BlogHomePage extends StatelessWidget {
  const BlogHomePage();

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    final model = context.watch<BlogState>();

    print(model.hashCode);

    return Scaffold(
      body: Container(
        height: scaler.sizer.height,
      ),
    );
  }
}
