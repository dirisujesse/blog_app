import 'package:flutter/material.dart';
import 'package:blog/utils/dimensions.dart';
import 'package:blog/style/style.dart';

class AppText extends StatelessWidget {
  final String data;
  final TextStyle style;
  final TextAlign textAlign;
  final Locale locale;
  final StrutStyle strutStyle;
  final bool softWrap;
  final int maxLines;
  final TextDirection textDirection;
  final TextOverflow overflow;
  final bool _isEditable;

  const AppText(
    this.data, {
    this.style,
    this.textAlign,
    this.locale,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    Key key,
  })  : _isEditable = false,
        super(key: key);

  const AppText.editable(
    this.data, {
    this.style,
    this.textAlign,
    this.locale,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
  }) : _isEditable = true;

  @override
  Widget build(BuildContext context) {
    final _style =
        style != null ? style : Theme.of(context).textTheme.bodyText1;
    final _fontSize = style != null ? _style.fontSize ?? 35.0 : 35.0;
    final fontSizer = AppScaleUtil(context).fontSizer;
    if (_isEditable) {
      return EditableText(
        toolbarOptions: ToolbarOptions(
          copy: true,
        ),
        readOnly: true,
        controller: TextEditingController(
          text: data,
        ),
        focusNode: FocusNode(),
        style: _style.copyWith(
          fontSize: fontSizer.sp(_fontSize),
        ),
        cursorColor: AppColors.green,
        backgroundCursorColor: AppColors.transparent,
        strutStyle: strutStyle,
        textAlign: textAlign ?? TextAlign.start,
        locale: locale,
        maxLines: maxLines,
        textDirection: textDirection,
        textWidthBasis: TextWidthBasis.parent,
      );
    }
    return Text(
      data ?? "",
      style: _style.copyWith(
        fontSize: fontSizer.sp(_fontSize),
      ),
      strutStyle: strutStyle,
      textAlign: textAlign,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textDirection: textDirection,
      textWidthBasis: TextWidthBasis.parent,
    );
  }
}
