import 'package:flutter/material.dart';

import '../../easy_toast.dart';

///
/// author：Vans Z
/// date： 2019-08-24
///

class TranslateAnimation extends StatefulWidget {
  final Widget child;

  const TranslateAnimation({Key key, this.child})
      : assert(child != null),
        super(key: key);

  @override
  _TranslateAnimationState createState() => _TranslateAnimationState();
}

class _TranslateAnimationState extends State<TranslateAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _control;
  Animation<Offset> _translate;
  Animation<double> _opacity;

  @override
  void initState() {
    _control = AnimationController(
      duration: const Duration(milliseconds: EasyToast.animationTimes),
      vsync: this,
    );
    var animation = CurvedAnimation(parent: _control, curve: Curves.linear);
    _translate = Tween<Offset>(begin: Offset(0, 40), end: Offset(0, 0)).animate(animation);
    _opacity = Tween<double>(begin: 0, end: 1).animate(animation);
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
      builder: (_, child) {
        return Transform.translate(
          offset: _translate.value,
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
