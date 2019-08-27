import 'package:flutter/material.dart';

import 'base_animation.dart';

///
/// author: Vans Z
/// date: 2019-08-24
///

class ScaleAnimation extends BaseAnimation {
  final Widget child;

  ScaleAnimation({Key key, bool isLoading: false, this.child})
      : assert(child != null),
        super(key: key, isLoading: isLoading);

  @override
  State<StatefulWidget> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation> with SingleTickerProviderStateMixin {
  AnimationController _control;
  Animation<double> _scale;
  Animation<double> _opacity;

  @override
  void initState() {
    _control = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    var animation = CurvedAnimation(parent: _control, curve: Curves.linear);
    _scale = Tween<double>(begin: 1.35, end: 1).animate(animation);
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
        return Transform.scale(
          scale: _scale.value,
          child: Opacity(
            opacity: _opacity.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
