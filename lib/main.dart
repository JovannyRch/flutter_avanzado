import 'package:flutter/material.dart';
import 'package:flutter_avanzado/screens/animaciones_screen.dart';
import 'package:flutter_avanzado/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Avanzado',
      home: Menu(),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Flutter Avanzado")),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Headers"),
              subtitle: Divider(),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              title: Text("Animaciones"),
              subtitle: Divider(),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AnimacionesScreen()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
