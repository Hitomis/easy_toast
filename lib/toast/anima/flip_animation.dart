import 'dart:math';

import 'package:flutter/material.dart';

import '../../easy_toast.dart';
import 'base_animation.dart';
import 'support//transform.dart' as matrix;

///
/// author: Vans Z
/// date: 2019-08-24
///

class FlipAnimation extends BaseAnimation {
  final Widget child;

  FlipAnimation({Key key, bool isLoading: false, this.child})
      : assert(child != null),
        super(key: key, isLoading: isLoading);

  @override
  State<StatefulWidget> createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation> with SingleTickerProviderStateMixin {
  AnimationController _control;
  Animation<double> _flip;
  Animation<Offset> _translate;
  Animation<double> _opacity;

  @override
  void initState() {
    _control = AnimationController(
      duration: const Duration(milliseconds: EasyToast.animationTimes),
      vsync: this,
    );
    var animation = CurvedAnimation(parent: _control, curve: Curves.linear);
    _flip = Tween<double>(begin: -pi, end: 0).animate(animation);
    _translate = Tween<Offset>(begin: Offset(0, 100), end: Offset(0, 0)).animate(animation);
    _opacity = Tween<double>(begin: 0, end: 1).animate(animation);
    if (!widget.isLoading) {
      Future.delayed(const Duration(milliseconds: 2000), () {
        try {
          _control.reverse();
        } catch (_) {}
      });
    }
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
      builder: (_, child) {
        return Transform.translate(
          offset: _translate.value,
          child: matrix.Transform.rotate(
            angle: _flip.value,
            child: Opacity(
              opacity: _opacity.value,
              child: child,
            ),
          ),
        );
      },
      child: widget.child,
    );
  }
}
