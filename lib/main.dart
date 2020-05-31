import 'package:flutter/material.dart';
import 'package:flutter_avanzado/screens/animaciones_screen.dart';
import 'package:flutter_avanzado/screens/emergency_app/emergency_screen.dart';
import 'package:flutter_avanzado/screens/headers_menu_screen.dart';
import 'package:flutter_avanzado/screens/loader/graficas_screen.dart';
import 'package:flutter_avanzado/screens/loader/loader_screen.dart';
import 'package:flutter_avanzado/screens/pinterest/pinterest_screen.dart';
import 'package:flutter_avanzado/screens/slides/slide_home_screen.dart';
import 'package:flutter_avanzado/screens/sliver_list_app/sliver_list_screen.dart';

import 'screens/animations_menu_screen.dart';

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
                  MaterialPageRoute(builder: (context) => HeaderMenu()),
                );
              },
            ),
            ListTile(
              title: Text("Animaciones"),
              subtitle: Divider(),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AnimationMenu()),
                );
              },
            ),
            ListTile(
              title: Text("Loader"),
              subtitle: Divider(),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoaderScreen()),
                );
              },
            ),
            ListTile(
              title: Text("Loaders"),
              subtitle: Divider(),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => GraficasScreen()),
                );
              },
            ),
            ListTile(
              title: Text("Slide Show"),
              subtitle: Divider(),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SlideShow()),
                );
              },
            ),
            ListTile(
              title: Text("Pinterest"),
              subtitle: Divider(),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PinterestScreen()),
                );
              },
            ),
            ListTile(
              title: Text("Emergency App"),
              subtitle: Divider(),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EmergencyPage()),
                );
              },
            ),
            ListTile(
              title: Text("Sliver List App"),
              subtitle: Divider(),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SliverListScreen()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
