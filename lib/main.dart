import 'package:flutter/material.dart';
import 'package:flutter_avanzado/theme/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'routes/routes.dart';

void main() => runApp(
    ChangeNotifierProvider(create: (_) => ThemeChanger(1), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeChanger>(context).currentTheme,
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
        drawer: _MenuPrincipal(),
        body:
            _ListaPaginas() /* ListView(
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
                      title: Text("Emergency"),
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
                    ),
                    ListTile(
                      title: Text("Animate Do"),
                      subtitle: Divider(),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AnimateDoScreen()),
                        );
                      },
                    )
                  ],
                ) */
        ,
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(20.0),
                width: double.infinity,
                height: 200.0,
                child: CircleAvatar(
                  backgroundColor: appTheme.currentTheme.accentColor,
                  child: Text(
                    "JRC",
                    style: TextStyle(fontSize: 50.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _ListaPaginas(),
            ),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: appTheme.currentTheme.accentColor,
              ),
              title: Text("Dark Mode"),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                onChanged: (value) {
                  appTheme.darkTheme = value;
                },
                activeColor: appTheme.currentTheme.accentColor,
              ),
            ),
            SafeArea(
              bottom: true,
              right: false,
              top: false,
              left: false,
              child: ListTile(
                leading: Icon(
                  Icons.add_to_home_screen,
                  color: appTheme.currentTheme.accentColor,
                ),
                title: Text("Custom Theme"),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  onChanged: (value) {
                    appTheme.customTheme = value;
                  },
                  activeColor: appTheme.currentTheme.accentColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ListaPaginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, i) => ListTile(
              leading:
                  FaIcon(screenRoutes[i].icon, color: appTheme.accentColor),
              title: Text(screenRoutes[i].titulo),
              trailing: Icon(
                Icons.chevron_right,
                color: appTheme.accentColor,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => screenRoutes[i].screen),
                );
              },
            ),
        separatorBuilder: (context, i) => Divider(
              color: appTheme.primaryColorLight,
            ),
        itemCount: screenRoutes.length);
  }
}
