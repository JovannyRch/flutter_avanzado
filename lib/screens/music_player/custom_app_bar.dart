import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 15.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: <Widget>[
            FaIcon(FontAwesomeIcons.chevronLeft),
            Spacer(),
            FaIcon(FontAwesomeIcons.commentAlt),
            SizedBox(width: 20.0),
            FaIcon(FontAwesomeIcons.headphonesAlt),
            SizedBox(width: 20.0),
            FaIcon(FontAwesomeIcons.externalLinkAlt),
          ],
        ),
      ),
    );
  }
}
