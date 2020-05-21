import 'package:flutter/material.dart';

class SquareHeader extends StatelessWidget {
  const SquareHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: double.infinity,
      color: Colors.green,
    );
  }
}

class RoundedHeader extends StatelessWidget {
  const RoundedHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0))),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
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

class HeaderTriangulo extends StatelessWidget {
  const HeaderTriangulo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _MiPainter2(),
      ),
    );
  }
}

class _MiPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    final path = new Path();
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _MiPainter3(),
      ),
    );
  }
}

class _MiPainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    final path = new Path();
    path.lineTo(0, size.height * 0.45);
    path.lineTo(size.width * 0.5, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.45);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _MiPainter4(),
      ),
    );
  }
}

class _MiPainter4 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    final path = new Path();
    path.lineTo(0, size.height * 0.45);
    //path.arcTo();
    //path.lineTo(size.width, size.height * 0.45);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.6, size.width, size.height * 0.45);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave extends StatelessWidget {
  const HeaderWave({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _MiPainter5(),
      ),
    );
  }
}

class _MiPainter5 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    final path = new Path();
    path.lineTo(0, size.height * 0.45);
    //path.arcTo();
    //path.lineTo(size.width, size.height * 0.45);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.5,
        size.width * 0.5, size.height * 0.45);

    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.4, size.width, size.height * 0.45);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderGradiente extends StatelessWidget {
  const HeaderGradiente({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _MiPainter6(),
      ),
    );
  }
}

class _MiPainter6 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = new Rect.fromCircle(
      center: Offset(0.0, 60.0),
      radius: 180.0,
    );
    Gradient g = new LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff6085e8),
          Color(0xffC012ff),
          Color(0xff6d05fa),
        ],
        stops: [
          0.0,
          0.3,
          1.0,
        ]);
    final paint = new Paint()..shader = g.createShader(rect);
    paint.style = PaintingStyle.fill;
    final path = new Path();
    path.lineTo(0, size.height * 0.45);
    //path.arcTo();
    //path.lineTo(size.width, size.height * 0.45);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.5,
        size.width * 0.5, size.height * 0.45);

    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.4, size.width, size.height * 0.45);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
