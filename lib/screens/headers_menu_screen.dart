import 'package:flutter/material.dart';
import 'package:flutter_avanzado/screens/headers_screen.dart';

class HeaderMenu extends StatelessWidget {
  List<String> ops = [
    'Header Cuadrado',
    'Header Redondeado',
    'Header Diagonal',
    'Header Triangular',
    'Header Curvo',
    'Header Wave',
    'Header Gradiante',
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HeadersHome(
                                    tipo: i + 1,
                                  )),
                        );
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
