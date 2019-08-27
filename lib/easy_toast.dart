library easy_toast;

import 'dart:async';

import 'package:easy_toast/toast/toast_view.dart';
import 'package:flutter/material.dart';

import 'toast/toast_config.dart';

class EasyToast {
  EasyToast._internal() {
    init();
  }

  static EasyToast _singleton = EasyToast._internal();
  static const animationTimes = 200;

  factory EasyToast() => _singleton;

  OverlayEntry _overlayEntry;
  Timer _timer;

  ToastConfig config;

  void init([ToastConfig config]) {
    this.config = ToastConfig();
    this.config
      ..horPadding = config?.horPadding ?? 12
      ..verPadding = config?.verPadding ?? 12
      ..horMargin = config?.horMargin ?? 20
      ..verMargin = config?.verMargin ?? 30
      ..space = config?.space ?? 8
      ..radius = config?.radius ?? 8
      ..iconWidth = config?.iconWidth ?? 70
      ..iconHeight = config?.iconHeight ?? 70
      ..loadingWidth = config?.loadingWidth ?? 100
      ..loadingHeight = config?.loadingHeight ?? 100
      ..fontSize = config?.fontSize ?? 16
      ..fontColor = config?.fontColor ?? Colors.white
      ..backgroundColor = config?.backgroundColor ?? const Color.fromRGBO(0, 0, 0, 0.7)
      ..animType = config?.animType ?? ToastAnim.fade;
  }

  void hide() {
    if (_overlayEntry != null) {
      _overlayEntry.remove();
      _overlayEntry = null;
    }

    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  void loading(
    BuildContext context, {
    String message,
    Widget loadingWidget,
    Alignment alignment = Alignment.center,
  }) {
    var toast = ToastView(
      text: message,
      loading: loadingWidget ?? SizedBox(width: 40, height: 40, child: CircularProgressIndicator()),
      config: config,
      alignment: alignment,
    );
    hide();
    _overlayEntry = OverlayEntry(builder: (context) => toast);
    Overlay.of(context).insert(_overlayEntry);
  }

  void toast(
    BuildContext context,
    String message, {
    Duration duration = const Duration(milliseconds: 2000),
    Alignment alignment = Alignment.bottomCenter,
  }) {
    var toast = ToastView(
      text: message,
      config: config,
      alignment: alignment,
    );
    _showToast(context, duration, toast);
  }

  void success(
    BuildContext context,
    String message, {
    Widget image,
    Duration duration = const Duration(milliseconds: 2000),
    Alignment alignment = Alignment.center,
  }) {
    var toast = ToastView(
      text: message,
      config: config,
      alignment: alignment,
      image: image ??
          Image.asset(
            "assets/image/icon_success.png",
            width: config.iconWidth,
            height: config.iconHeight,
            package: "easy_toast",
          ),
    );
    _showToast(context, duration, toast);
  }

  void error(
    BuildContext context,
    String message, {
    Widget image,
    Duration duration = const Duration(milliseconds: 2000),
    Alignment alignment = Alignment.center,
  }) {
    var toast = ToastView(
      text: message,
      config: config,
      alignment: alignment,
      image: Image.asset(
        "assets/image/icon_error.png",
        width: config.iconWidth,
        height: config.iconHeight,
        package: "easy_toast",
      ),
    );
    _showToast(context, duration, toast);
  }

  void fail(
    BuildContext context,
    String message, {
    Widget image,
    Duration duration = const Duration(milliseconds: 2000),
    Alignment alignment = Alignment.center,
  }) {
    var toast = ToastView(
      text: message,
      config: config,
      alignment: alignment,
      image: Image.asset(
        "assets/image/icon_fail.png",
        width: config.iconWidth,
        height: config.iconHeight,
        package: "easy_toast",
      ),
    );
    _showToast(context, duration, toast);
  }

  void info(
    BuildContext context,
    String message, {
    Widget image,
    Duration duration = const Duration(milliseconds: 2000),
    Alignment alignment = Alignment.center,
  }) {
    var toast = ToastView(
      text: message,
      config: config,
      alignment: alignment,
      image: Image.asset(
        "assets/image/icon_info.png",
        width: config.iconWidth,
        height: config.iconHeight,
        package: "easy_toast",
      ),
    );
    _showToast(context, duration, toast);
  }

  void custom(
    BuildContext context,
    Widget toastWidget, {
    Widget image,
    Duration duration = const Duration(milliseconds: 2000),
    Alignment alignment = Alignment.bottomCenter,
  }) {
    var toast = ToastView(
      config: config,
      alignment: alignment,
      custom: toastWidget,
    );
    _showToast(context, duration, toast);
  }

  void _showToast(BuildContext context, Duration duration, Widget toastView) {
    hide();
    _overlayEntry = OverlayEntry(builder: (context) => toastView);
    Overlay.of(context).insert(_overlayEntry);
    duration = duration + const Duration(milliseconds: animationTimes * 2);
    _timer = Timer(duration, () => hide());
  }
}

final easyToast = EasyToast();
