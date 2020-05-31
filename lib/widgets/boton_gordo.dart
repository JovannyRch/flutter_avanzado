import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String titulo;
  final IconData icon;
  BotonGordo({this.color1, this.color2, this.titulo, this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _BotonGordoBackground(
          color1: color1,
          color2: color2,
          icon: this.icon,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          SizedBox(
            height: 140.0,
            width: 40.0,
          ),
          FaIcon(
            this.icon,
            color: Colors.white,
            size: 40.0,
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Text(
              this.titulo,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
          FaIcon(
            FontAwesomeIcons.chevronRight,
            color: Colors.white,
            size: 20.0,
          ),
          SizedBox(
            width: 40.0,
          )
        ]),
      ],
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  const _BotonGordoBackground({
    Key key,
    @required this.color1,
    @required this.color2,
    @required this.icon,
  }) : super(key: key);

  final Color color1;
  final Color color2;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                this.icon,
                color: Colors.white.withOpacity(0.2),
                size: 150.0,
              ),
            ),
          ],
        ),
      ),
      height: 100.0,
      width: double.infinity,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(4, 6),
              blurRadius: 10.0,
            )
          ],
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(colors: [
            this.color1,
            this.color2,
          ])),
    );
  }
}
