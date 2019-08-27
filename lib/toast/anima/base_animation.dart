import 'package:flutter/material.dart';

///
/// author: Vans Z
/// date: 2019-08-27
///

abstract class BaseAnimation extends StatefulWidget {
  BaseAnimation({this.key, this.isLoading: false});

  final Key key;
  final bool isLoading;
}
