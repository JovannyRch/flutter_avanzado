import 'dart:math' as Math;
import 'dart:ui';

import 'package:flutter/material.dart';

class LoaderScreen extends StatefulWidget {
  @override
  _LoaderScreenState createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen>
    with SingleTickerProviderStateMixin {
  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;
  AnimationController animationController;

  @override
  void initState() {
    this.animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 400));
    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        animationController.reset();
      }

      setState(() {
        this.porcentaje =
            lerpDouble(porcentaje, nuevoPorcentaje, animationController.value);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    this.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          this.porcentaje = this.nuevoPorcentaje;
          this.nuevoPorcentaje += 0.10;
          if (this.porcentaje >= 1.0) {
            this.porcentaje = 0.0;
            this.nuevoPorcentaje = 0.0;
          }
          this.animationController.forward();
          setState(() {});
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.refresh),
      ),
      body: Scaffold(
        body: Center(
          child: Rectangulo(
            porcentaje: porcentaje,
          ),
        ),
      ),
    );
  }
}

class Rectangulo extends StatelessWidget {
  final double porcentaje;
  Rectangulo({this.porcentaje});
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
