import 'package:easy_toast/toast/anima/alpha_animation.dart';
import 'package:easy_toast/toast/toast_config.dart';
import 'package:flutter/material.dart';

///
/// author: Vans Z
/// date: 2019-08-16
///

enum ToastType { loading, success, error, info, warning, custom }

class ToastView extends StatefulWidget {
  ToastView({
    this.text,
    this.space,
    this.bgColor,
    this.alignment,
    this.border,
    this.custom,
  });

  final String text;
  final double space;
  final Color bgColor;
  final Alignment alignment;
  final BorderRadiusGeometry border;
  final Widget custom;

  @override
  State<StatefulWidget> createState() => _ToastViewState();
}

class _ToastViewState extends State<ToastView> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: Container(
        margin: _smartEdge(),
        child: widget.custom ??
            AlphaAnimation(ToastConfig(
              widget.text,
              border: widget.border,
              bgColor: widget.bgColor,
            )),
      ),
    );
  }

  EdgeInsetsGeometry _smartEdge() {
    var alignment = widget.alignment;
    var space = widget.space;
    if (alignment == Alignment.topCenter ||
        alignment == Alignment.topLeft ||
        alignment == Alignment.topRight) {
      return EdgeInsets.only(top: space ?? 30, left: 20, right: 20);
    } else if (alignment == Alignment.bottomCenter ||
        alignment == Alignment.bottomLeft ||
        alignment == Alignment.bottomRight) {
      return EdgeInsets.only(bottom: space ?? 30, left: 20, right: 20);
    } else {
      return EdgeInsets.zero;
    }
  }
}
