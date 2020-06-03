import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text("Notification Screen"),
        ),
        floatingActionButton: Botonflotante(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class Botonflotante extends StatelessWidget {
  const Botonflotante({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: FaIcon(FontAwesomeIcons.play),
      backgroundColor: Colors.pink,
      onPressed: () {
        final notiModel =
            Provider.of<_NotificationModel>(context, listen: false);
        final int notificaciones = notiModel.numero;
        notiModel.numero = notificaciones + 1;

        if (notificaciones >= 1) {
          notiModel.bounce.forward(from: 0.0);
        }
      },
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int notificaciones = Provider.of<_NotificationModel>(context).numero;
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bone), title: Text("Bones")),
        BottomNavigationBarItem(
            icon: Stack(
              children: <Widget>[
                FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: BounceInDown(
                    animate: notificaciones > 0,
                    from: 10,
                    child: Bounce(
                      controller: (controller) =>
                          Provider.of<_NotificationModel>(context).bounce =
                              controller,
                      from: 10,
                      child: Container(
                        width: 12,
                        height: 12,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "$notificaciones",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 7,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            title: Text("Notifications")),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.dog), title: Text("My Dog")),
      ],
    );
  }
}

class _NotificationModel with ChangeNotifier {
  int _numero = 0;
  AnimationController _bounce;

  int get numero => _numero;
  set numero(int numero) {
    _numero = numero;
    notifyListeners();
  }

  AnimationController get bounce => _bounce;
  set bounce(Animation controller) {
    _bounce = controller;
    notifyListeners();
  }
}
