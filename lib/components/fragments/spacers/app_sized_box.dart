import 'package:flutter/widgets.dart';
import 'package:blog/utils/dimensions.dart';

class AppSizedBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;

  const AppSizedBox({this.height = 0, this.width = 0, this.child});

  @override
  Widget build(BuildContext context) {
    final sizer = AppScaleUtil(context).sizer;
    return SizedBox(
      height: sizer.setHeight(height),
      width: sizer.setWidth(width),
      child: child,
    );
  }
}
