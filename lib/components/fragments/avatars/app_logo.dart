import 'package:blog/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:blog/values/images.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return SvgPicture.asset(
      AppSvgs.logo,
      fit: BoxFit.scaleDown,
      alignment: Alignment.center,
      height: scaler.sizer.setHeight(10),
    );
  }
}
