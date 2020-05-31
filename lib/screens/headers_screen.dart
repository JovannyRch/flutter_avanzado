import 'package:flutter/material.dart';
import 'package:flutter_avanzado/widgets/headers_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeadersHome extends StatelessWidget {
  final int tipo;
  HeadersHome({this.tipo = 1});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: getHeader(this.tipo),
      ),
    );
  }

  Widget getHeader(int opc) {
    print("Valor del opc $opc");
    switch (opc) {
      case 1:
        return SquareHeader();
      case 2:
        return RoundedHeader();
      case 3:
        return HeaderDiagonal();
      case 4:
        return HeaderTriangulo();

      case 5:
        return HeaderCurvo();

      case 6:
        return HeaderWave();
      case 7:
        return HeaderGradiente();
      default:
    }
    return HeaderGradiente();
  }
}

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const IconHeader(
      {@required this.icon,
      @required this.titulo,
      @required this.subtitulo,
      @required this.color1,
      @required this.color2});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _IconHeaderBackground(
          color1: color1,
          color2: color2,
        ),
        _Icon(),
        _Column()
      ],
    );
  }

  Widget _Column() {
    Color blanco = Colors.white.withOpacity(0.7);
    return Column(
      children: <Widget>[
        SizedBox(
          height: 80,
          width: double.infinity,
        ),
        Text(
          this.subtitulo,
          style: TextStyle(
            color: blanco,
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          this.titulo,
          style: TextStyle(
            color: blanco,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        FaIcon(
          this.icon,
          size: 80.0,
          color: Colors.white,
        )
      ],
    );
  }

  Positioned _Icon() {
    return Positioned(
      child: FaIcon(
        this.icon,
        size: 250.0,
        color: Colors.white.withOpacity(0.2),
      ),
      top: -50,
      left: -70,
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBackground({@required this.color1, @required this.color2});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0)),
        gradient: LinearGradient(
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
            colors: <Color>[
              this.color1,
              this.color2,
            ]),
      ),
    );
  }
}
