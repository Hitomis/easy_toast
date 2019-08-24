import 'package:flutter/material.dart';

///
/// author：Vans Z
/// date： 2019/2/26
///

/// 算出在percent的时候在 [startColor, endColor]中的颜色值
Color calcCurrentColor(Color startColor, Color endColor, double percent) {
  var alphaStart = startColor.alpha;
  var redStart = startColor.red;
  var greenStart = startColor.green;
  var blueStart = startColor.blue;

  var alphaEnd = endColor.alpha;
  var redEnd = endColor.red;
  var greenEnd = endColor.green;
  var blueEnd = endColor.blue;

  var alphaDifference = alphaEnd - alphaStart;
  var redDifference = redEnd - redStart;
  var blueDifference = blueEnd - blueStart;
  var greenDifference = greenEnd - greenStart;

  var a = (alphaStart + percent * alphaDifference).toInt();
  var r = (redStart + percent * redDifference).toInt();
  var g = (greenStart + percent * greenDifference).toInt();
  var b = (blueStart + percent * blueDifference).toInt();

  return Color.fromARGB(a, r, g, b);
}
