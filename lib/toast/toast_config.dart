import 'dart:ui';

import 'package:flutter/widgets.dart';

///
/// author：Vans Z
/// date： 2019-08-24
///

class ToastConfig {
  ToastConfig(
    this.text, {
    this.border,
    this.bgColor,
  });

  final String text;
  final BorderRadiusGeometry border;
  final Color bgColor;
}
