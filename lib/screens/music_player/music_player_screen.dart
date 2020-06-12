import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avanzado/helpers/helpers.dart';
import 'package:flutter_avanzado/models/music_player_model.dart';
import 'package:flutter_avanzado/screens/music_player/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mainContent = Column(
      children: <Widget>[
        CustomAppBar(),
        ImagenDiscoDuracion(),
        TituloPlay(),
        Expanded(
          child: Lyrics(),
        ),
      ],
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MusicPlayerModel(),
        )
      ],
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Background(),
          mainContent,
        ],
      )),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60.0)),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.center,
            colors: [
              Color(0xFF33333E),
              Color(0xFF201e28),
            ]),
      ),
    );
  }
}

class Lyrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListWheelScrollView(
        itemExtent: 42,
        diameterRatio: 1.5,
        physics: BouncingScrollPhysics(),
        children: lyrics
            .map((e) => Text(e,
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.white,
                )))
            .toList(),
      ),
    );
  }
}

class TituloPlay extends StatefulWidget {
  @override
  _TituloPlayState createState() => _TituloPlayState();
}

class _TituloPlayState extends State<TituloPlay>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  bool firtsPlaying = true;
  AnimationController animationController;
  final assetAudioPlayer = new AssetsAudioPlayer();
  final audios = <Audio>[
    Audio(
      "assets/audios/rock.mp3",
      metas: Metas(
        id: "Rock",
        title: "Rock",
        artist: "Florent Champigny",
        album: "RockAlbum",
        image: MetasImage.network(
            "https://static.radio.fr/images/broadcasts/cb/ef/2075/c300.png"),
      ),
    )
  ];
  @override
  void initState() {
    // TODO: implement initState
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void open() {
    final playerModel = Provider.of<MusicPlayerModel>(context, listen: false);
    assetAudioPlayer.open(
      Audio("assets/song.mp3"),
    );
    assetAudioPlayer.currentPosition.listen((event) {
      playerModel.current = event;
    });
    assetAudioPlayer.current.listen((event) {
      playerModel.songDuration = event.audio.duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      margin: EdgeInsets.only(top: 40.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "Boulevard of Broken Dreams",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Text(
                "-Green Day-",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ],
          ),
          Spacer(),
          FloatingActionButton(
              highlightElevation: 0,
              elevation: 0,
              onPressed: () {
                final audioPlayerModel =
                    Provider.of<MusicPlayerModel>(context, listen: false)
                        .controller;
                if (this.isPlaying) {
                  this.animationController.reverse();
                  audioPlayerModel.stop();
                } else {
                  this.animationController.forward();
                  audioPlayerModel.repeat();
                }
                this.isPlaying = !this.isPlaying;
                if (this.firtsPlaying) {
                  this.firtsPlaying = false;
                  this.open();
                } else {
                  assetAudioPlayer.playOrPause();
                }
              },
              backgroundColor: Color(0xfff8cb51),
              child: AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                progress: animationController,
              ))
        ],
      ),
    );
  }
}

class ImagenDiscoDuracion extends StatelessWidget {
  const ImagenDiscoDuracion({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      margin: EdgeInsets.only(top: 100.0),
      child: Row(children: <Widget>[
        ImagenDisco(),
        SizedBox(width: 20.0),
        BarraProgreso(),
        SizedBox(width: 20.0),
      ]),
    );
  }
}

class BarraProgreso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var style2 = TextStyle(color: Colors.white.withOpacity(0.4));

    final audioPlayerModel = Provider.of<MusicPlayerModel>(context);
    final porcentaje = audioPlayerModel.porcentaje;

    return Container(
      child: Column(
        children: <Widget>[
          Text("${audioPlayerModel.songTotalDuration}", style: style2),
          Stack(
            children: <Widget>[
              Container(
                width: 3,
                height: 230,
                color: Colors.white.withOpacity(0.1),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 3,
                  height: 230 * audioPlayerModel.porcentaje,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
          Text("${audioPlayerModel.currentSecond}", style: style2),
        ],
      ),
    );
  }
}

class ImagenDisco extends StatelessWidget {
  const ImagenDisco({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<MusicPlayerModel>(context);
    var image = Image.asset('assets/album.jpg');
    var circulito = Container(
      width: 25.0,
      height: 25.0,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
    var circulito2 = Container(
      width: 18.0,
      height: 18.0,
      decoration: BoxDecoration(
        color: Color(0xFF1c1c25),
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
    var container = Container(
      padding: EdgeInsets.all(20.0),
      height: 250,
      width: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SpinPerfect(
                duration: Duration(seconds: 30),
                infinite: true,
                child: image,
                manualTrigger: true,
                controller: (animatrionController) {
                  audioPlayerModel.controller = animatrionController;
                }),
            circulito,
            circulito2,
          ],
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Color(0xFF484750),
              Color(0xFF1C1E24),
            ],
          )),
    );
    return container;
  }
}
