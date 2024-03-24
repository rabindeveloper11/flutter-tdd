import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SVGUtils {
  /// converts svg string to widget, pasing the [assetName] which is the path of
  /// the asset in .svg format, [width] and [height] are optional parameters
  /// to set the width and height of the svg image
  static Widget svgFromAsset(String assetName,
      {double? width, double? height, Color? color}) {
    return SvgPicture.asset(
      assetName,
      color: color,
      width: width,
      height: height,
    );
  }
}
