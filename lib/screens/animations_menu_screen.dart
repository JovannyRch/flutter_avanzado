import 'package:flutter/material.dart';
import 'package:flutter_avanzado/screens/animaciones_screen.dart';
import 'package:flutter_avanzado/screens/animations_reto_1.dart';
import 'package:flutter_avanzado/screens/headers_screen.dart';

class AnimationMenu extends StatelessWidget {
  List<String> ops = [
    'Cuadrado animado',
    'Reto: Cuadrado con animacion cuadricular',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Headers"),
        ),
        body: ListView(
            children: this
                .ops
                .asMap()
                .map((i, el) => MapEntry(
                    i,
                    ListTile(
                      onTap: () {
                        if (i == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AnimacionesScreen()),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Reto1()),
                          );
                        }
                      },
                      title: Text(el),
                      trailing: Icon(Icons.arrow_forward_ios),
                      subtitle: Divider(),
                    )))
                .values
                .toList()),
      ),
    );
  }
}
