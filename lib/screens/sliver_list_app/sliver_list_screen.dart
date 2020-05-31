import 'package:flutter/material.dart';

class SliverListScreen extends StatelessWidget {
  const SliverListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MainScroll(),
          Positioned(
            child: _BotonNewList(),
            bottom: 0.0,
            right: 0.0,
          ),
        ],
      ),
    );
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 70.0,
      child: RaisedButton(
        onPressed: () => {},
        color: Color(0xFFED6762),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0))),
        child: Text(
          "Crear nueva lista",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}

class MainScroll extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: _SliverCustomHeaderDelegate(
              maxHeight: 200,
              minHeight: 170,
              child: Container(
                alignment: Alignment.centerLeft,
                color: Colors.white,
                child: _Titulo(),
              )),
          floating: true,
        ),
        SliverList(
            delegate: SliverChildListDelegate(
          [
            ...items,
            SizedBox(
              height: 100.0,
            )
          ],
        )),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {@required this.minHeight,
      @required this.maxHeight,
      @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _ListaTareas extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 30.0,
      ),
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 10.0,
        ),
        child: Text(
          "New",
          style: TextStyle(fontSize: 50.0, color: Color(0xff532128)),
        ),
      ),
      Stack(
        children: <Widget>[
          SizedBox(
            width: 100.0,
          ),
          Positioned(
            bottom: 8,
            child: Container(
              width: 140,
              height: 8.0,
              decoration: BoxDecoration(color: Color(0xfff7cdd5)),
            ),
          ),
          Container(
            child: Text(
              "List",
              style: TextStyle(
                  color: Color(0xffD93a30),
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      )
    ]);
  }
}

class _ListItem extends StatelessWidget {
  final String texto;
  final Color color;
  _ListItem(this.texto, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        this.texto,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      height: 130.0,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
