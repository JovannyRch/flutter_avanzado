import 'package:flutter/material.dart';
import 'package:flutter_avanzado/widgets/headers_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Header1(),
      ),
    );
  }
}
