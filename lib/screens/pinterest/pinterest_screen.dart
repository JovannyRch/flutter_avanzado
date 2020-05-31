import 'package:flutter/material.dart';
import 'package:flutter_avanzado/widgets/pinteres_menu_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(children: <Widget>[
          PinteresGrid(),
          PinterestPositioned(ancho: ancho, alto: alto),
        ]),
      ),
    );
  }
}

class PinterestPositioned extends StatelessWidget {
  const PinterestPositioned({
    Key key,
    @required this.ancho,
    @required this.alto,
  }) : super(key: key);

  final double ancho;
  final double alto;

  @override
  Widget build(BuildContext context) {
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    return Positioned(
      child: Container(
        width: ancho,
        child: Align(
            child: PinterestMenu(
          mostrar: mostrar,
          backgroundColor: Colors.white,
          activeColor: Colors.red,
          secondaryColor: Colors.blueGrey,
        )),
      ),
      top: alto * 0.90,
    );
  }
}

class PinteresGrid extends StatefulWidget {
  @override
  _PinteresGridState createState() => _PinteresGridState();
}

class _PinteresGridState extends State<PinteresGrid> {
  ScrollController controller = new ScrollController();
  List<int> items = List.generate(100, (index) => index);
  double scrollAnterior = 0;
  @override
  void initState() {
    super.initState();
    this.controller.addListener(() {
      if (this.controller.offset > this.scrollAnterior) {
        //Ocultar
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        //Mostrar
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      this.scrollAnterior = this.controller.offset;
    });
  }

  @override
  void dispose() {
    this.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final index;
  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.blue,
        ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;
  get mostrar => _mostrar;

  set mostrar(bool valor) {
    this._mostrar = valor;
    notifyListeners();
  }
}

/* 

zfs create rpool/$carpeta
zfs list | grep $carpeta
zfs set sharenfs=on rpool/$carpeta
showmount -e | grep $carpeta
chmod -R 755 /rpool/$carpeta


mount -F nfs -o rw ip:/rpool/$1 /carpeta/
 

*/
