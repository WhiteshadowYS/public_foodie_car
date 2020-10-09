import 'package:flutter/material.dart';

class CustomPlayIconPaint extends CustomPainter {
  final double value;
  final double sizeIcon;
  final Color color;
  final Color strokeColor;

  CustomPlayIconPaint({
    @required this.value,
    @required this.sizeIcon,
    @required this.color,
    @required this.strokeColor,
  });

  void _drawPath(Canvas canvas, Paint paint, Paint paintStroke) {
    canvas.save();
    Path path = Path();
    canvas.restore();
    path.addPolygon(
      [
        Offset(0, 0),
        Offset(sizeIcon, (sizeIcon / 2) * value),
        Offset(sizeIcon, (sizeIcon / 2 - ((sizeIcon / 8) * (1 - value)))),
        Offset(0, (sizeIcon / 2 - ((sizeIcon / 8) * (1 - value)))),
      ],
      true,
    );
    path.addPolygon(
      [
        Offset(0, sizeIcon),
        Offset(sizeIcon, sizeIcon - (sizeIcon / 2) * value),
        Offset(sizeIcon, (sizeIcon / 2 + ((sizeIcon / 8) * (1 - value)))),
        Offset(0, (sizeIcon / 2 + ((sizeIcon / 8) * (1 - value)))),
      ],
      true,
    );
    canvas.drawPath(path, paint);
    canvas.drawPath(path, paintStroke);
  }

  @override
  void paint(Canvas canvas, Size size) {
    size = Size(sizeIcon, sizeIcon);
    Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..color = color ?? Colors.black;
    Paint paintStroke = Paint()
      ..strokeCap = StrokeCap.square
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = sizeIcon / 10
      ..style = PaintingStyle.stroke
      ..color = strokeColor ?? Colors.black;
    _drawPath(canvas, paint, paintStroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
