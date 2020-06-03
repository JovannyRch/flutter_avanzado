import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_avanzado/screens/animate_do/navigation_screen.dart';
import 'package:flutter_avanzado/screens/animate_do/twitter_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimateDoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(child: Text("Animate_do")),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              return Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => TwitterPage()),
              );
            },
            icon: FaIcon(FontAwesomeIcons.twitter),
          ),
          SlideInLeft(
            from: 100,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (BuildContext context) => AnimateDoScreen()));
              },
              icon: Icon(Icons.navigate_next),
            ),
          )
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {
            return Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NavigationScreen()),
            );
          },
          child: FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElasticIn(
              delay: Duration(milliseconds: 1100),
              child: Icon(
                Icons.new_releases,
                color: Colors.blue,
                size: 40.0,
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 200),
              child: Text(
                "Titulo",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Colors.blue,
                ),
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 800),
              child: Text(
                "Texto pequeño",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.blue,
                ),
              ),
            ),
            FadeInLeft(
              duration: Duration(milliseconds: 1000),
              child: Container(
                width: 220,
                height: 2.0,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
