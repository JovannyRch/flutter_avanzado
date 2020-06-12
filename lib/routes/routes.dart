import 'package:flutter/material.dart';
import 'package:flutter_avanzado/screens/animate_do/animate_do_screen.dart';
import 'package:flutter_avanzado/screens/animations_menu_screen.dart';
import 'package:flutter_avanzado/screens/emergency_app/emergency_screen.dart';
import 'package:flutter_avanzado/screens/headers_menu_screen.dart';
import 'package:flutter_avanzado/screens/loader/loader_screen.dart';
import 'package:flutter_avanzado/screens/music_player/music_player_screen.dart';
import 'package:flutter_avanzado/screens/pinterest/pinterest_screen.dart';
import 'package:flutter_avanzado/screens/slides/slide_home_screen.dart';
import 'package:flutter_avanzado/screens/sliver_list_app/sliver_list_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final screenRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, "Slideshow", SlideShow()),
  _Route(FontAwesomeIcons.ambulance, "Emergency", EmergencyPage()),
  _Route(FontAwesomeIcons.heading, "Headers", HeaderMenu()),
  _Route(FontAwesomeIcons.peopleCarry, "Cuadro Animado", AnimationMenu()),
  _Route(FontAwesomeIcons.circleNotch, "Barras de progreso", LoaderScreen()),
  _Route(FontAwesomeIcons.pinterest, "Pinterest", PinterestScreen()),
  _Route(FontAwesomeIcons.mobile, "Slivers", SliverListScreen()),
  _Route(FontAwesomeIcons.patreon, "Animate Do", AnimateDoScreen()),
  _Route(FontAwesomeIcons.music, "Music Player", MusicPlayer()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget screen;

  _Route(this.icon, this.titulo, this.screen);
}
