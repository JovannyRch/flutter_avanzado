import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.icon, @required this.onPressed});
}

class PinterestMenu extends StatelessWidget {
  final List<PinterestButton> items = [
    PinterestButton(
        icon: Icons.pie_chart, onPressed: () => {print("Icon pie chart")}),
    PinterestButton(
        icon: Icons.search, onPressed: () => {print("Icon search")}),
    PinterestButton(
        icon: Icons.notifications,
        onPressed: () => {print("Ico notificacionts")}),
    PinterestButton(
        icon: Icons.supervised_user_circle,
        onPressed: () => {print("Icon supervised icon")}),
  ];
  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color secondaryColor;
  //PinterestMenu({@required this.items});
  PinterestMenu(
      {this.mostrar = true,
      this.backgroundColor,
      this.activeColor,
      this.secondaryColor});

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        opacity: this.mostrar ? 1 : 0,
        duration: Duration(milliseconds: 300),
        child: _PinterestBackground(
          ancho: ancho,
          background: this.backgroundColor,
          child: _MenuItems(items),
        ),
      ),
    );
  }
}

class _PinterestBackground extends StatelessWidget {
  const _PinterestBackground(
      {Key key,
      @required this.ancho,
      @required this.child,
      @required this.background})
      : super(key: key);

  final double ancho;
  final Color background;
  final child;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: ancho * 0.75,
      height: 60.0,
      decoration: BoxDecoration(
        color: this.background,
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 10.0,
            color: Colors.black38,
            spreadRadius: -5,
          )
        ],
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  _MenuItems(this.menuItems);
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(this.menuItems.length,
            (index) => _PinterestMenuItem(this.menuItems[index], index)));
  }
}

class _PinterestMenuItem extends StatelessWidget {
  final PinterestButton b;
  final index;
  _PinterestMenuItem(
    this.b,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            this.index;
        b.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          b.icon,
          size: itemSeleccionado == index ? 30.0 : 25.0,
          color: itemSeleccionado == index ? Colors.black : Colors.blueGrey,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  int get itemSeleccionado => this._itemSeleccionado;
  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }
}
