import 'package:blog/utils/dimensions.dart';
import 'package:flutter/widgets.dart';

extension WidgetExtensions on Widget {
  List<Widget> operator *(int count) {
    return List.generate(count, (_) => this);
  }
}

extension ScaleExtension on BuildContext {
  AppScaleUtil get scaler {
    return AppScaleUtil(this);
  }
}
