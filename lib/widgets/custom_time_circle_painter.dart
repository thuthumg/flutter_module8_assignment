import 'dart:math';

import 'package:flutter/material.dart';


class CustomTimeCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCirclePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;

    Paint innerCirclePaint1 = Paint()
      ..color = Color.fromRGBO(28, 94, 186, 1)
      ..style = PaintingStyle.fill;

    Paint innerCirclePaint2 = Paint()
      ..color = Color.fromRGBO(19, 75, 157, 1)
      ..style = PaintingStyle.fill;
     // ..strokeWidth = 100;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double outerRadius = size.width / 2 - 10;
    double innerRadius1 = size.width / 2.2;
    double innerRadius2 = size.width / 4.2;
  //  canvas.drawCircle(Offset(centerX, centerY), outerRadius, outerCirclePaint);
  //  canvas.drawCircle(Offset(centerX, centerY), innerRadius, innerCirclePaint);

    canvas.drawCircle(Offset(centerX, centerY), outerRadius, outerCirclePaint);
    canvas.drawCircle(Offset(centerX, centerY), innerRadius1, innerCirclePaint1);
    canvas.drawCircle(Offset(centerX, centerY), innerRadius2, innerCirclePaint2);


    final double centerX1 = size.width / 2;
    final double centerY1 = size.height / 2;
    final Paint paint = Paint()..color = Colors.white70;
    final double filledCircleRadius = 3;
    final int numberOfDots = 20;
    final double radiantStep = 2 * pi / numberOfDots;
    for (int i = 0; i < numberOfDots; i++) {
      canvas.drawCircle(
        Offset(centerX1 + sin(i * radiantStep) * 108,
            centerY1 + cos(i * radiantStep) * 108),
        filledCircleRadius,
        paint,
      );
    }


    Paint linePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
    ..strokeWidth = 5;
    canvas.drawLine(Offset(centerX1+105,67), Offset(centerX1+170,67), linePaint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
/*

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCirclePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Paint innerCirclePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double outerRadius = size.width / 2 - 10;
    double innerRadius = size.width / 4;

    canvas.drawCircle(Offset(centerX, centerY), outerRadius, outerCirclePaint);
    canvas.drawCircle(Offset(centerX, centerY), innerRadius, innerCirclePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

In this example, we define two Paint objects, outerCirclePaint and innerCirclePaint, with different colors and styles. We then calculate the center coordinates and radius values for the outer and inner circles based on the size of the CustomPaint widget.

Finally, we use the drawCircle method of the Canvas class to draw the outer and inner circles with the respective Paint objects and radius values.

You can customize the colors, styles, and radius values of the circles as per your requirements. Additionally, you can use the shouldRepaint method to determine whether the CustomPainter widget needs to be repainted, based on some condition such as a change in the data or state of the widget.
ms.jellyfishgirl@gmail.com
How to draw the outer circle and inner circle with spotted  in custom painter in flutter

To draw an outer circle and an inner circle with a dotted or dashed stroke in custom painter in Flutter, you can set the dashStyle property of the Paint object to a DashStyle value with a non-zero dash parameter. Here's an example code snippet:

arduino
*/

/*class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCirclePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..shader = null // set shader if needed
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10)
      ..blendMode = BlendMode.srcOver
      ..colorFilter = ColorFilter.mode(Colors.green, BlendMode.srcOver)
      ..filterQuality = FilterQuality.low
      ..strokeJoin = StrokeJoin.round
      ..strokeMiterLimit = 10
      ..dashStyle = DashStyle(
        dashLength: 5,
        spaceLength: 5,
        dashOffset: 0,
      );

    Paint innerCirclePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..shader = null // set shader if needed
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10)
      ..blendMode = BlendMode.srcOver
      ..colorFilter = ColorFilter.mode(Colors.green, BlendMode.srcOver)
      ..filterQuality = FilterQuality.low
      ..strokeJoin = StrokeJoin.round
      ..strokeMiterLimit = 10
      ..dashStyle = DashStyle(
        dashLength: 5,
        spaceLength: 5,
        dashOffset: 0,
      );

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double outerRadius = size.width / 2 - 10;
    double innerRadius = size.width / 4;

    canvas.drawCircle(Offset(centerX, centerY), outerRadius, outerCirclePaint);
    canvas.drawCircle(Offset(centerX, centerY), innerRadius, innerCirclePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}*/
