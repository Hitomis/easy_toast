import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

///
/// author：Vans Z
/// date： 2019-08-24
///

class Transform extends SingleChildRenderObjectWidget {
  const Transform({
    Key key,
    @required this.transform,
    this.origin,
    this.alignment,
    this.transformHitTests = true,
    Widget child,
  }) : assert(transform != null),
        super(key: key, child: child);
  Transform.rotate({
    Key key,
    @required double angle,
    this.origin,
    this.alignment = Alignment.center,
    this.transformHitTests = true,
    Widget child,
  }) : transform = Matrix4.rotationX(angle),
        super(key: key, child: child);

  Transform.translate({
    Key key,
    @required Offset offset,
    this.transformHitTests = true,
    Widget child,
  }) : transform = Matrix4.translationValues(offset.dx, offset.dy, 0.0),
        origin = null,
        alignment = null,
        super(key: key, child: child);

  Transform.scale({
    Key key,
    @required double scale,
    this.origin,
    this.alignment = Alignment.center,
    this.transformHitTests = true,
    Widget child,
  }) : transform = Matrix4.diagonal3Values(scale, scale, 1.0),
        super(key: key, child: child);

  /// The matrix to transform the child by during painting.
  final Matrix4 transform;

  /// The origin of the coordinate system (relative to the upper left corder of
  /// this render object) in which to apply the matrix.
  ///
  /// Setting an origin is equivalent to conjugating the transform matrix by a
  /// translation. This property is provided just for convenience.
  final Offset origin;

  /// The alignment of the origin, relative to the size of the box.
  ///
  /// This is equivalent to setting an origin based on the size of the box.
  /// If it is specified at the same time as the [origin], both are applied.
  ///
  /// An [AlignmentDirectional.start] value is the same as an [Alignment]
  /// whose [Alignment.x] value is `-1.0` if [textDirection] is
  /// [TextDirection.ltr], and `1.0` if [textDirection] is [TextDirection.rtl].
  /// Similarly [AlignmentDirectional.end] is the same as an [Alignment]
  /// whose [Alignment.x] value is `1.0` if [textDirection] is
  /// [TextDirection.ltr], and `-1.0` if [textDirection] is [TextDirection.rtl].
  final AlignmentGeometry alignment;

  /// Whether to apply the transformation when performing hit tests.
  final bool transformHitTests;

  @override
  RenderTransform createRenderObject(BuildContext context) {
    return RenderTransform(
      transform: transform,
      origin: origin,
      alignment: alignment,
      textDirection: Directionality.of(context),
      transformHitTests: transformHitTests,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderTransform renderObject) {
    renderObject
      ..transform = transform
      ..origin = origin
      ..alignment = alignment
      ..textDirection = Directionality.of(context)
      ..transformHitTests = transformHitTests;
  }
}