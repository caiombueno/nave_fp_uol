import 'package:flutter/material.dart';

abstract class KnotCoreRadius {
  static const none = BorderRadius.all(Radius.circular(0));
  static const small = BorderRadius.all(Radius.circular(4));
  static const medium = BorderRadius.all(Radius.circular(8));
  static const mediumLarge = BorderRadius.all(Radius.circular(12));
  static const large = BorderRadius.all(Radius.circular(16));
}

abstract class KnotSemanticRadius {
  static const kanbanColumn = KnotCoreRadius.large;
}
