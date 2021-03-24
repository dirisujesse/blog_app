import 'package:flutter/material.dart';
import 'package:blog/style/text_styles.dart';
import 'package:blog/utils/dimensions.dart';
import 'package:blog/style/colors.dart';

class AppTextSpan extends StatelessWidget {
  final List<String> messages;
  final double fontSize;
  final TextAlign textAlign;
  final bool forceLineBreak;

  const AppTextSpan({
    @required this.messages,
    this.textAlign = TextAlign.left,
    this.fontSize = 45,
    this.forceLineBreak = true,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = AppScaleUtil(context);
    return RichText(
      text: TextSpan(
        children: messages.map(
          (message) {
            final embolden = message.startsWith("(BOLD)");
            if (embolden) {
              message = message.substring(6);
            }
            final appendage = !forceLineBreak
                ? ""
                : message == messages.last
                    ? ""
                    : "\n\n";
            return TextSpan(
              text: "$message$appendage",
              style: embolden
                  ? AppTextStyle.medium.copyWith(
                      color: AppColors.black,
                      fontSize: scaler.fontSizer.sp(fontSize),
                      fontWeight: FontWeight.w900,
                    )
                  : null,
            );
          },
        ).toList(),
        style: AppTextStyle.medium.copyWith(
          color: AppColors.black,
          fontSize: scaler.fontSizer.sp(fontSize),
          fontWeight: FontWeight.w600,
        ),
      ),
      textAlign: textAlign,
    );
  }
}
