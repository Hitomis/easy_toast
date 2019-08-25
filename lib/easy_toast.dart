library easy_toast;

import 'dart:async';

import 'package:easy_toast/toast/toast_view.dart';
import 'package:flutter/widgets.dart';

class EasyToast {
  EasyToast._internal();

  static EasyToast _singleton = EasyToast._internal();
  static const animationTimes = 200;

  factory EasyToast() => _singleton;

  OverlayEntry _overlayEntry;
  Timer _timer;

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
    BuildContext context, [
    Alignment alignment = Alignment.center,
  ]) {
    hide();
    _overlayEntry = OverlayEntry(builder: (context) => null);
    Overlay.of(context).insert(_overlayEntry);
  }

  void toast(
    BuildContext context,
    String message, [
    Duration duration = const Duration(milliseconds: 2000),
    Alignment alignment = Alignment.bottomCenter,
  ]) {
    var toast = ToastView(
      text: message,
      alignment: alignment,
    );
    _showToast(context, duration, toast);
  }

  void success(
    BuildContext context,
    String message, [
    Duration duration = const Duration(milliseconds: 2000),
    Alignment alignment = Alignment.center,
  ]) {
    var toast = ToastView(
      text: message,
      alignment: alignment,
      image: Image.asset(
        "assets/image/icon_success.png",
        width: 70,
        height: 70,
        package: "easy_toast",
      ),
    );
    _showToast(context, duration, toast);
  }

  void error(
    BuildContext context,
    String message, [
    Duration duration = const Duration(milliseconds: 2000),
    Alignment alignment = Alignment.center,
  ]) {
    var toast = ToastView(
      text: message,
      alignment: alignment,
      image: Image.asset(
        "assets/image/icon_error.png",
        width: 70,
        height: 70,
        package: "easy_toast",
      ),
    );
    _showToast(context, duration, toast);
  }

  void fail(
      BuildContext context,
      String message, [
        Duration duration = const Duration(milliseconds: 2000),
        Alignment alignment = Alignment.center,
      ]) {
    var toast = ToastView(
      text: message,
      alignment: alignment,
      image: Image.asset(
        "assets/image/icon_fail.png",
        width: 70,
        height: 70,
        package: "easy_toast",
      ),
    );
    _showToast(context, duration, toast);
  }

  void info(
    BuildContext context,
    String message, [
    Duration duration = const Duration(milliseconds: 2000),
    Alignment alignment = Alignment.center,
  ]) {
    var toast = ToastView(
      text: message,
      alignment: alignment,
      image: Image.asset(
        "assets/image/icon_info.png",
        width: 70,
        height: 70,
        package: "easy_toast",
      ),
    );
    _showToast(context, duration, toast);
  }

  void custom() {}

  void _showToast(BuildContext context, Duration duration, Widget toastView) {
    hide();
    _overlayEntry = OverlayEntry(builder: (context) => toastView);
    Overlay.of(context).insert(_overlayEntry);
    duration = duration + const Duration(milliseconds: animationTimes * 2);
    _timer = Timer(duration, () => hide());
  }
}

final easyToast = EasyToast();
