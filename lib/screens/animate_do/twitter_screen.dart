import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool animate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1da1f2),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            animate = !animate;
          });
        },
        backgroundColor: Colors.pink,
        child: Icon(CupertinoIcons.play_arrow),
      ),
      body: Center(
        child: ZoomOut(
          animate: animate,
          from: 30,
          duration: Duration(seconds: 1),
          child: FaIcon(
            FontAwesomeIcons.twitter,
            size: 60.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
