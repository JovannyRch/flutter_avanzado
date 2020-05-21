import 'package:flutter/material.dart';

class Reto1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController ctrl;
  //Animaciones
  Animation<double> x1;
  Animation<double> x2;
  Animation<double> y1;
  Animation<double> y2;

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    ctrl = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4500));
    x1 = new Tween(begin: 0.0, end: 150.0).animate(CurvedAnimation(
        parent: ctrl, curve: Interval(0.0, 0.25, curve: Curves.bounceInOut)));

    y1 = new Tween(begin: 0.0, end: -150.0).animate(CurvedAnimation(
        parent: ctrl, curve: Interval(0.25, 0.50, curve: Curves.bounceInOut)));

    x2 = new Tween(begin: 0.0, end: 150.0).animate(CurvedAnimation(
        parent: ctrl, curve: Interval(.50, 0.75, curve: Curves.bounceInOut)));

    y2 = new Tween(begin: 0.0, end: -150.0).animate(CurvedAnimation(
        parent: ctrl, curve: Interval(0.75, 1.0, curve: Curves.bounceInOut)));
    ctrl.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ctrl,
      child: Rectangulo(),
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(x1.value - x2.value, y1.value - y2.value),
          child: Rectangulo(),
        );
      },
    );
  }
}

class Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
