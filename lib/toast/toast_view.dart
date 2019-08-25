import 'package:easy_toast/toast/anima/fade_animation.dart';
import 'package:easy_toast/toast/anima/translate_animation.dart';
import 'package:flutter/material.dart';

import 'anima/rotate_animation.dart';
import 'anima/scale_animation.dart';

///
/// author: Vans Z
/// date: 2019-08-16
///

enum ToastType { loading, success, error, info, warning, custom }

class ToastView extends StatefulWidget {
  ToastView({
    this.text,
    this.image,
    this.space,
    this.bgColor,
    this.alignment,
    this.border,
    this.custom,
  });

  final String text;
  final Image image;
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
            RotateAnimation(child :Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 0, 0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: widget.image == null ? _buildTextToast() : _buildImageToast(),
            )),
      ),
    );
  }

  Widget _buildImageToast() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      widget.image,
      SizedBox(height: 8),
      _buildTextToast(),
    ],
  );

  Widget _buildTextToast() => Text(
    widget.text ?? "",
    textAlign: TextAlign.center,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      decoration: TextDecoration.none,
    ),
  );

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
      return EdgeInsets.symmetric(horizontal: 20);
    }
  }
}
