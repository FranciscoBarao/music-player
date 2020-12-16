import 'package:flutter/material.dart';
import 'package:audio_manager/audio_manager.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:webinar/song/panel.dart';

// https://pub.dev/packages/audio_manager/example
// Está aqui um exemplo de como usar bem o audio manager

// Para chamar esta class -> SongMenu(song: song)
// Ver em SongList
class SongMenu extends StatefulWidget {
  final List<SongInfo> list;
  final num index;
  SongMenu({@required this.list, this.index});

  @override
  _SongMenu createState() => _SongMenu();
}

class _SongMenu extends State<SongMenu> {
  bool isPlaying = false;
  Duration _duration;
  Duration _position;
  double _slider;
  num curIndex;
  List<AudioInfo> _list = [];
  PlayMode playMode = AudioManager.instance.playMode;

  @override
  void initState() {
    super.initState();
    setupAudio();
    AudioManager.instance.play();
  }

  @override
  void dispose() {
    // 释放所有资源
    AudioManager.instance.release();
    super.dispose();
  }

  void setupAudio() {
    for (int i = widget.index; i < widget.list.length; i++) {
      SongInfo item = widget.list[i];
      _list.add(AudioInfo("file://${item.filePath}",
          title: "${item.title}",
          desc: "${item.artist}",
          coverUrl: "assets/images/dog.jpg"));
    }

    for (int i = 0; i < widget.index; i++) {
      SongInfo item = widget.list[i];
      _list.add(AudioInfo("file://${item.filePath}",
          title: "${item.title}",
          desc: "${item.artist}",
          coverUrl: "assets/images/dog.jpg"));
    }

    AudioManager.instance.audioList = _list;

    AudioManager.instance.onEvents((events, args) {
      print("$events, $args");
      switch (events) {
        case AudioManagerEvents.start:
          print(
              "start load data callback, curIndex is ${AudioManager.instance.curIndex}");
          _position = AudioManager.instance.position;
          _duration = AudioManager.instance.duration;
          _slider = 0;
          setState(() {});
          break;
        case AudioManagerEvents.seekComplete:
          _position = AudioManager.instance.position;
          _slider = _position.inMilliseconds / _duration.inMilliseconds;
          setState(() {});
          break;
        case AudioManagerEvents.timeupdate:
          _position = AudioManager.instance.position;
          _duration = AudioManager.instance.duration;
          _slider = _position.inMilliseconds / _duration.inMilliseconds;
          setState(() {});
          break;
        case AudioManagerEvents.playstatus:
          isPlaying = AudioManager.instance.isPlaying;
          setState(() {});
          break;
        case AudioManagerEvents.ended:
          AudioManager.instance.next();
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Music Player'),
        ),
        body: new Stack(
          children: <Widget>[
            new Align(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(AudioManager.instance.info.title,
                        style: TextStyle(fontSize: 24),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(AudioManager.instance.info.desc,
                        style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            )),
            new Center(
              child: Image(
                  height: 190,
                  width: 250,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/dog.jpg')),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Panel(
                  duration: _duration,
                  position: _position,
                  slider: _slider,
                  playing: isPlaying,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
