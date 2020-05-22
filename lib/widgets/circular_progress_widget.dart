import 'package:flutter/material.dart';
import 'dart:math' as Math;

class CircularProgress extends StatelessWidget {
  final double porcentaje;

  CircularProgress({this.porcentaje});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: 200,
      height: 200,
      decoration: BoxDecoration(),
      child: CustomPaint(
        painter: _Radial(porcentaje: porcentaje),
      ),
    );
  }
}

class _Radial extends CustomPainter {
  final double porcentaje;
  _Radial({this.porcentaje});

  @override
  void paint(Canvas canvas, Size size) {
    //Circulo completado
    final paint = new Paint()
      ..strokeWidth = 4.0
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    double radio = Math.min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radio, paint);

    //Arco
    final paintArco = new Paint()
      ..strokeWidth = 10.0
      ..color = Colors.orange
      ..style = PaintingStyle.stroke;

    //Parte que se va a ir llenando
    double arcAngle = 2 * Math.pi * (porcentaje);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -Math.pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
