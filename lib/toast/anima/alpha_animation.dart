import 'dart:async';

import 'package:easy_toast/toast/toast_config.dart';
import 'package:flutter/material.dart';

import 'view_helper.dart';

///
/// author: Vans Z
/// date: 2019-08-23
///

class AlphaAnimation extends StatefulWidget {
  AlphaAnimation(this.config);

  final ToastConfig config;

  @override
  State<StatefulWidget> createState() => _AlphaAnimationState();
}

class _AlphaAnimationState extends State<AlphaAnimation> with SingleTickerProviderStateMixin {
  Animation<double> _alpha;
  AnimationController _control;

  @override
  void initState() {
    _control = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _alpha = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _control,
      curve: Curves.linear,
    ));
    Future.delayed(const Duration(milliseconds: 1800), () {
      try {
        _control.reverse();
      } catch (_) {}
    });
    _control.forward();
    super.initState();
  }

  @override
  void dispose() {
    _control?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _control,
      builder: (context, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: calcCurrentColor(Colors.transparent,
              widget.config.bgColor ?? const Color.fromRGBO(0, 0, 0, 0.7), _alpha.value),
          borderRadius: widget.config.border ?? BorderRadius.circular(8),
        ),
        child: Text(
          widget.config.text ?? "",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
