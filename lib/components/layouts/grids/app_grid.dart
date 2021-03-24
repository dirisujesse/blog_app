import 'package:blog/components/layouts/lists/app_recycler.dart';
import 'package:flutter/material.dart';
import 'package:blog/utils/dimensions.dart';
import 'package:blog/utils/typedefs.dart';

class AppGrid extends StatelessWidget {
  final double aspectRatio;
  final int itemLength;
  final double height;
  final double maxHeight;
  final ItemBuilder itemBuilder;
  final double spacing;
  final bool isLoading;
  final OnPressed onScrollEnd;
  final num currentPage;
  final num pages;
  final Axis scrollDirection;
  final EdgeInsetsGeometry padding;

  AppGrid({
    this.spacing = 2.5,
    this.aspectRatio,
    this.isLoading = true,
    this.onScrollEnd,
    this.currentPage = 1,
    this.pages = 1,
    this.maxHeight,
    this.scrollDirection = Axis.horizontal,
    this.padding,
    @required this.itemLength,
    @required this.height,
    @required this.itemBuilder,
  })  : assert(itemLength != null),
        assert(height != null),
        assert(itemBuilder != null);

  @override
  Widget build(BuildContext context) {
    final scaler = AppScaleUtil(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: scaler.sizer.setHeight(height),
        maxHeight: scaler.sizer.setHeight(maxHeight ?? height),
      ),
      child: AppRecyclerView(
        currentPage: currentPage,
        pages: pages,
        onScrollEnd: onScrollEnd ?? () {},
        isLoading: isLoading,
        canFetch: currentPage < pages,
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          padding: padding,
          scrollDirection: scrollDirection,
          itemCount: itemLength,
          semanticChildCount: itemLength,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: scaler.sizer.setWidth(3),
            mainAxisSpacing: scaler.sizer.setWidth(spacing),
            crossAxisCount: 1,
            childAspectRatio: aspectRatio ?? 5 / 5,
          ),
          itemBuilder: itemBuilder,
        ),
      ),
    );
  }
}
