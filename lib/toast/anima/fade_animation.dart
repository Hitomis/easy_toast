import 'dart:async';

import 'package:easy_toast/easy_toast.dart';
import 'package:flutter/material.dart';

///
/// author: Vans Z
/// date: 2019-08-23
///

class FadeAnimation extends StatefulWidget {
  final Widget child;

  const FadeAnimation({Key key, this.child})
      : assert(child != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation> with SingleTickerProviderStateMixin {
  Animation<double> _alpha;
  AnimationController _control;

  @override
  void initState() {
    _control = AnimationController(
      duration: const Duration(milliseconds: EasyToast.animationTimes),
      vsync: this,
    );
    _alpha = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _control,
      curve: Curves.linear,
    ));
    Future.delayed(const Duration(milliseconds: 2000), () {
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
    return FadeTransition(
      opacity: _alpha,
      child: widget.child,
    );
  }
}
