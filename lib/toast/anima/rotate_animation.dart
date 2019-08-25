import 'dart:math';

import 'package:flutter/material.dart';
import '../../easy_toast.dart';
import 'support//transform.dart' as matrix;

///
/// author: Vans Z
/// date: 2019-08-24
///

class RotateAnimation extends StatefulWidget {
  final Widget child;

  const RotateAnimation({Key key, this.child})
      : assert(child != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _RotateAnimationState();
}

class _RotateAnimationState extends State<RotateAnimation> with SingleTickerProviderStateMixin {
  AnimationController _control;
  Animation<double> _rotate;
  Animation<Offset> _translate;
  Animation<double> _opacity;

  @override
  void initState() {
    _control = AnimationController(
      duration: const Duration(milliseconds: EasyToast.animationTimes),
      vsync: this,
    );
    var animation = CurvedAnimation(parent: _control, curve: Curves.linear);
    _rotate = Tween<double>(begin: 0, end: 2 * pi).animate(animation);
    _translate = Tween<Offset>(begin: Offset(0, 100), end: Offset(0, 0)).animate(animation);
    _opacity = Tween<double>(begin: 0, end: 1).animate(animation);
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
    return AnimatedBuilder(
      animation: _control,
      builder: (_, child) {
        return Transform.translate(
          offset: _translate.value,
          child: matrix.Transform.rotate(
            angle: _rotate.value,
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
