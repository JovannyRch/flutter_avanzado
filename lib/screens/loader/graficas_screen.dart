import 'package:flutter/material.dart';
import 'package:flutter_avanzado/widgets/circular_progress_widget.dart';

class GraficasScreen extends StatefulWidget {
  GraficasScreen({Key key}) : super(key: key);

  @override
  _GraficasScreenState createState() => _GraficasScreenState();
}

class _GraficasScreenState extends State<GraficasScreen> {
  double porcentaje = 0.0;
  double ancho = 0.0;
  double alto = 0.0;
  @override
  Widget build(BuildContext context) {
    alto = MediaQuery.of(context).size.height;
    ancho = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              porcentaje += .10;
              if (this.porcentaje > 1.00) {
                this.porcentaje = 0.0;
              }
              setState(() {});
            },
            child: Icon(Icons.refresh)),
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    loader(Colors.pink),
                    loader(Colors.purple),
                  ],
                ),
                Row(
                  children: <Widget>[
                    loader(Colors.yellow),
                    loader(Colors.red),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget loader(Color color) {
    return Container(
      height: ancho * 0.5,
      width: ancho * 0.5,
      child: CircularProgress(
        porcentaje: porcentaje,
        color: color,
      ),
    );
  }
}
