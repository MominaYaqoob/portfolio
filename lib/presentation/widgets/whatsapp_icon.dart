import 'package:flutter/material.dart';

/// Lightweight WhatsApp logo that renders without Font Awesome brand fonts.
class WhatsAppIcon extends StatelessWidget {
  const WhatsAppIcon({
    super.key,
    this.size = 28,
    this.color = Colors.white,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: _WhatsAppIconPainter(color),
    );
  }
}

class _WhatsAppIconPainter extends CustomPainter {
  const _WhatsAppIconPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final w = size.width;
    final h = size.height;

    // Speech bubble
    canvas.drawCircle(Offset(w * 0.5, h * 0.44), w * 0.34, paint);

    final tail = Path()
      ..moveTo(w * 0.2, h * 0.58)
      ..lineTo(w * 0.1, h * 0.76)
      ..lineTo(w * 0.32, h * 0.56)
      ..close();
    canvas.drawPath(tail, paint);

    // Phone handset
    final phone = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.085
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(w * 0.5, h * 0.43),
        width: w * 0.22,
        height: h * 0.22,
      ),
      2.4,
      2.6,
      false,
      phone,
    );
    canvas.drawLine(
      Offset(w * 0.57, h * 0.5),
      Offset(w * 0.64, h * 0.57),
      phone,
    );
  }

  @override
  bool shouldRepaint(covariant _WhatsAppIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
