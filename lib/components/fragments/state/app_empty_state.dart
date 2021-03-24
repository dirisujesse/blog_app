import 'package:blog/components/fragments/buttons/app_button.dart';
import 'package:blog/components/fragments/spacers/app_sized_box.dart';
import 'package:blog/components/typography/app_text.dart';
import 'package:blog/style/colors.dart';
import 'package:blog/style/style.dart';
import 'package:blog/utils/dimensions.dart';
import 'package:blog/utils/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppEmptyState extends StatelessWidget {
  final String message;
  final String subMessage;
  final OnPressed onRetry;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  AppEmptyState({
    @required this.message,
    this.onRetry,
    this.subMessage,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  })  : assert(message != null);
  @override
  Widget build(BuildContext context) {
    final scaler = AppScaleUtil(context);
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        Icon(
          Icons.workspaces_outline,
          size: scaler.fontSizer.sp(200),
        ),
        const AppSizedBox(height: .5),
        Flexible(
          child: AppText(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight:
                  subMessage != null ? FontWeight.bold : FontWeight.w300,
            ),
          ),
        ),
        if (subMessage != null) const AppSizedBox(height: .5),
        if (subMessage != null)
          Flexible(
            child: AppText(
              subMessage,
              textAlign: TextAlign.center,
              style: AppTextStyle.light,
            ),
          ),
        if (onRetry != null)
        Flexible(
          child: FittedBox(
            child: AppButton(
            text: "Refresh",
            textColor: AppColors.green,
            color: AppColors.transparent,
            onPressed: onRetry,
          ),
          ),
        ),
      ],
    );
  }
}
