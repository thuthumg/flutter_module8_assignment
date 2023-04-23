import 'package:flutter/material.dart';
class DottedLine extends StatelessWidget {
  final double height;
  final Color color;
  final double strokeWidth;
  final bool dashLineFlag;

  DottedLine({this.height = 100, this.color = Colors.grey, this.strokeWidth = 1, this.dashLineFlag = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: CustomPaint(
        painter: DottedLinePainter(color: color, strokeWidth: strokeWidth,dashLineFlag: dashLineFlag ),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final bool dashLineFlag;

  DottedLinePainter({this.color = Colors.grey, this.strokeWidth = 1, this.dashLineFlag = false });

  @override
  void paint(Canvas canvas, Size size) {

    if(dashLineFlag == true)
    activeDrawLine(canvas,size);
    else
    inActiveDrawLine(canvas,size);


  }

  @override
  bool shouldRepaint(DottedLinePainter oldDelegate) {
   // return oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
    return false;
  }

  void activeDrawLine(Canvas canvas, Size size)
  {

    Paint linePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true
      ..shader = null
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 1.0);

    Paint circlePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    double centerX = size.width / 2;
    double startY = 0;
    double endY = size.height - 20;

    for (double i = startY; i < endY; i += 10) {
      canvas.drawLine(
        Offset(centerX, i),
        Offset(centerX, i + 5),
        linePaint,
      );
    }

    canvas.drawCircle(Offset(centerX, endY), 5, circlePaint);
  }

  void inActiveDrawLine(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final double dashWidth = 5.0;
    final double dashSpace = 5.0;

    double startY = 0.0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY  + dashWidth), paint);
      startY += dashWidth;
    }
  }
}