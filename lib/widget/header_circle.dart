import 'package:flutter/material.dart';
import 'package:fusia/color/colors_theme.dart';
import 'dart:math' as math;

class HeaderCircle extends StatefulWidget {
  final double diameter;

  const HeaderCircle({Key? key, required this.diameter}) : super(key: key);

  @override
  _HeaderCircle createState() => _HeaderCircle();
}

class _HeaderCircle extends State<HeaderCircle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RotatedBox(
          quarterTurns: 2,
          child: CustomPaint(
            painter: CustomCircle(),
            size: Size(widget.diameter, widget.diameter),
          ),
        ),
      ],
    );
  }
}

class CustomCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = ColorsTheme.primary!;
    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, 500),
          width: 800,
          height: 403.75,
        ),
        math.pi,
        math.pi,
        false,
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
