import 'package:flutter/cupertino.dart';

///
/// author：Vans Z
/// date： 2019-08-25
///

enum ToastAnim {fade, flip, scale, translate}

class ToastConfig {
  double horPadding;
  double verPadding;
  double horMargin;
  double verMargin;
  double space;
  double radius;
  double iconWidth;
  double iconHeight;
  double fontSize;
  double loadingWidth;
  double loadingHeight;
  Color fontColor;
  Color backgroundColor;
  ToastAnim animType;
}