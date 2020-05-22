import 'package:flutter/material.dart';
import 'dart:math' as Math;

class CircularProgress extends StatefulWidget {
  final double porcentaje;
  final Color color;
  CircularProgress({this.porcentaje, this.color = Colors.green});

  @override
  _CircularProgressState createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  double porcentajeAnterior;
  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward(from: 0.0);

    final direfenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.all(10.0),
          height: double.infinity,
          width: double.infinity,
          child: CustomPaint(
            painter: _Radial(
                color: widget.color,
                porcentaje: (widget.porcentaje - direfenciaAnimar) +
                    (direfenciaAnimar * animationController.value)),
          ),
        );
      },
    );

    /* return Container(
      padding: EdgeInsets.all(10.0),
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _Radial(porcentaje: widget.porcentaje),
      ),
    ); */
  }
}

class _Radial extends CustomPainter {
  final double porcentaje;
  final Color color;
  _Radial({this.porcentaje, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    //Circulo completado
    final paint = new Paint()
      ..strokeWidth = 4.0
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    double radio = Math.min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radio, paint);

    //Arco
    final paintArco = new Paint()
      ..strokeWidth = 10.0
      ..color = color
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
