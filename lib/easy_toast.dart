library easy_toast;

import 'dart:async';

import 'package:easy_toast/toast/toast_view.dart';
import 'package:flutter/widgets.dart';

class EasyToast {
  EasyToast._internal();

  static EasyToast _singleton = EasyToast._internal();

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
    Duration duration = const Duration(seconds: 2),
    Alignment alignment = Alignment.center,
  ]) {
    hide();
    _overlayEntry = OverlayEntry(builder: (context) => null);
    Overlay.of(context).insert(_overlayEntry);
  }

  void normal(
    BuildContext context,
    String message, [
    Duration duration = const Duration(seconds: 2),
    Alignment alignment = Alignment.bottomCenter,
  ]) {
    hide();
    _overlayEntry = OverlayEntry(
        builder: (context) => ToastView(
              text: message,
              alignment: alignment,
            ));
    Overlay.of(context).insert(_overlayEntry);
    _timer = Timer(duration, () => hide());
  }

  void success() {}

  void error() {}

  void info() {}

  void warning() {}

  void custom() {}
}

final easyToast = EasyToast();