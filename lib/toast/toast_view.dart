import 'package:easy_toast/toast/anima/fade_animation.dart';
import 'package:easy_toast/toast/anima/translate_animation.dart';
import 'package:easy_toast/toast/toast_config.dart';
import 'package:flutter/material.dart';

import 'anima/flip_animation.dart';
import 'anima/scale_animation.dart';

///
/// author: Vans Z
/// date: 2019-08-16
///

class ToastView extends StatefulWidget {
  ToastView({
    @required this.config,
    this.text,
    this.image,
    this.custom,
    this.loading,
    this.alignment,
  });

  final String text;
  final ToastConfig config;
  final Image image;
  final Widget custom;
  final Widget loading;
  final Alignment alignment;

  @override
  State<StatefulWidget> createState() => _ToastViewState();
}

class _ToastViewState extends State<ToastView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment ?? Alignment.bottomCenter,
      child: Container(
        margin: _smartEdge(),
        child: _warpAnimation(),
      ),
    );
  }

  Widget _warpAnimation() {
    switch (widget.config.animType) {
      case ToastAnim.fade:
        return FadeAnimation(
          child: widget.custom ?? _buildToastContent(),
          isLoading: widget.loading != null,
        );
      case ToastAnim.flip:
        return FlipAnimation(
          child: widget.custom ?? _buildToastContent(),
          isLoading: widget.loading != null,
        );
      case ToastAnim.scale:
        return ScaleAnimation(
          child: widget.custom ?? _buildToastContent(),
          isLoading: widget.loading != null,
        );
      case ToastAnim.translate:
        return TranslateAnimation(
          child: widget.custom ?? _buildToastContent(),
          isLoading: widget.loading != null,
        );
      default:
        return FadeAnimation(
          child: widget.custom ?? _buildToastContent(),
          isLoading: widget.loading != null,
        );
    }
  }

  Widget _buildToastContent() {
    if (widget.loading == null) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: widget.config.horPadding,
          vertical: widget.config.verPadding,
        ),
        decoration: BoxDecoration(
          color: widget.config.backgroundColor,
          borderRadius: BorderRadius.circular(widget.config.radius),
        ),
        child: widget.image == null ? _buildTextToast() : _buildImageToast(),
      );
    } else {
      return Container(
        constraints: BoxConstraints(
          minWidth: widget.config.loadingWidth,
          minHeight: widget.config.loadingHeight
        ),
        padding: EdgeInsets.symmetric(
            horizontal: widget.config.horPadding, vertical: widget.config.verPadding),
        decoration: BoxDecoration(
          color: widget.config.backgroundColor,
          borderRadius: BorderRadius.circular(widget.config.radius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            widget.loading,
            SizedBox(height: widget.config.space),
            _buildTextToast(),
          ],
        ),
      );
    }
  }

  Widget _buildImageToast() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          widget.image,
          SizedBox(height: widget.config.space),
          _buildTextToast(),
        ],
      );

  Widget _buildTextToast() => Text(
        widget.text ?? "",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: widget.config.fontColor,
          fontSize: widget.config.fontSize,
          decoration: TextDecoration.none,
        ),
      );

  EdgeInsetsGeometry _smartEdge() {
    var alignment = widget.alignment;
    var verMargin = widget.config.verMargin;
    var horMargin = widget.config.horMargin;
    if (alignment == Alignment.topCenter ||
        alignment == Alignment.topLeft ||
        alignment == Alignment.topRight) {
      return EdgeInsets.only(top: verMargin, left: horMargin, right: horMargin);
    } else if (alignment == null ||
        alignment == Alignment.bottomCenter ||
        alignment == Alignment.bottomLeft ||
        alignment == Alignment.bottomRight) {
      return EdgeInsets.only(bottom: verMargin, left: horMargin, right: horMargin);
    } else {
      return EdgeInsets.symmetric(horizontal: horMargin);
    }
  }
}
