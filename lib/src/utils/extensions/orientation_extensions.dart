import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension OrientationExtensions on Orientation {
  List<DeviceOrientation> get deviceOrientations {
    return (this == Orientation.landscape)
        ? [
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]
        : [
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ];
  }
}
