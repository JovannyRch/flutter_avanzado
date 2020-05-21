import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesScreen extends StatelessWidget {
  const AnimacionesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {},
        child: Icon(Icons.play_arrow),
      ),
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
  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> opacidadOut;
  Animation<double> mover;
  Animation<double> escala;
  AnimationController animationCrl;

  @override
  void initState() {
    animationCrl = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 3000));
    super.initState();

    rotacion = Tween(begin: 0.0, end: Math.pi * 2)
        .animate(CurvedAnimation(parent: animationCrl, curve: Curves.easeOut));

    opacidad = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationCrl,
        curve: Interval(0.0, 0.75, curve: Curves.easeOut)));

    opacidadOut = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationCrl,
        curve: Interval(0.75, 1.0, curve: Curves.easeOut)));

    mover = Tween(begin: 0.0, end: 200.0).animate(animationCrl);
    escala = Tween(begin: 0.0, end: 2.0).animate(animationCrl);

    animationCrl.addListener(() {
      if (animationCrl.status == AnimationStatus.completed) {
        animationCrl.reverse();
      } else if (animationCrl.status == AnimationStatus.dismissed) {
        animationCrl.forward();
      }
    });
    //animationCrl.repeat();
    animationCrl.forward();
  }

  @override
  void dispose() {
    animationCrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationCrl,
      //child: _Rectangulo(),
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
            offset: Offset(mover.value, mover.value),
            child: Transform.rotate(
                angle: rotacion.value,
                child: Opacity(
                  opacity: opacidadOut.value,
                  child: Opacity(
                    opacity: opacidad.value,
                    child: Transform.scale(
                        scale: escala.value, child: _Rectangulo()),
                  ),
                )));
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
