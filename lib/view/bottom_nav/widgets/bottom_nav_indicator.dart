import 'package:flutter/material.dart';

class BottomNavIndicator extends StatelessWidget {
  const BottomNavIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(50, (20).toDouble()), painter: BottomNavIndicatorPainter());
  }
}

class BottomNavIndicatorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0008333, 0);
    path_0.quadraticBezierTo(size.width * 0.2503083, size.height * 0.0010571, size.width * 0.5002333, size.height * 0.6442857);
    path_0.quadraticBezierTo(size.width * 0.7503000, size.height * -0.0016143, size.width * 0.9991667, size.height * -0.0014286);
    path_0.lineTo(size.width * -0.0008333, 0);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
