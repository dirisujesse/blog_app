import 'package:blog/components/fragments/buttons/app_button.dart';
import 'package:blog/components/fragments/spacers/app_sized_box.dart';
import 'package:blog/components/typography/app_text.dart';
import 'package:blog/style/colors.dart';
import 'package:blog/utils/typedefs.dart';
import 'package:blog/values/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppErrorState extends StatelessWidget {
  final String errorMessage;
  final OnPressed onRetry;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  AppErrorState({
    @required this.errorMessage,
    @required this.onRetry,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  })  : assert(errorMessage != null),
        assert(onRetry != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        SvgPicture.asset(AppSvgs.failure),
        const AppSizedBox(height: .5),
        Flexible(
          child: AppText(
            errorMessage,
            textAlign: TextAlign.center,
          ),
        ),
        Flexible(
          child: FittedBox(
            child: AppButton(
              text: "Retry",
              textColor: AppColors.red,
              onPressed: onRetry,
              color: AppColors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
