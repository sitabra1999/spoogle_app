import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';

class FabNotchShape extends ShapeBorder {
  const FabNotchShape({
    required this.borderRadius,
    required this.holeSize,
    this.offset = Offset.zero,
    this.side = BorderSide.none,
  });

  final Radius borderRadius;
  final Offset offset;
  final BorderSide side;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (side != BorderSide.none) {
      canvas.drawPath(
        _getPath(rect),
        side.toPaint(),
      );
    }
  }

  Path _getPath(Rect rect) {
    return Path.combine(
      PathOperation.difference,
      Path()
        ..addRRect(RRect.fromRectAndRadius(rect, borderRadius))
        ..close(),
      Path()
        ..addOval(Rect.fromCircle(
          center: Offset(0, rect.height) + offset,
          radius: holeSize,
        ))
        ..close(),
    );
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  final double holeSize;

  @override
  ui.Path getOuterPath(ui.Rect rect, {ui.TextDirection? textDirection}) => _getPath(rect);

  @override
  ShapeBorder scale(double t) => this;
}
