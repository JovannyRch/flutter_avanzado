import 'package:flutter/material.dart';

class SquareHeader extends StatelessWidget {
  const SquareHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class RoundedHeader extends StatelessWidget {
  const RoundedHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Header1 extends StatelessWidget {
  const Header1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: CustomPaint(
        painter: _MiPainter(),
      ),
    );
  }
}

class _MiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    final path = new Path();
    path.lineTo(0, size.height * 0.40);
    path.lineTo(size.width, size.height * 0.35);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
