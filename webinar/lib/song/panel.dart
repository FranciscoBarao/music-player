import 'package:flutter/material.dart';
import 'package:audio_manager/audio_manager.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:webinar/song/songMenu.dart';

class Panel extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final double slider;
  final bool playing;

  Panel({
    @required this.duration,
    this.position,
    this.slider,
    this.playing,
  });

  @override
  _Panel createState() => _Panel();
}

// Currently, o painel é um Card.. pode ficar se entretanto ficar bonito..
// mas pode-se retirar para ficar mais parecido com a imagem (bonito xD)
// Cuidado a retirar ou adicionar stuff porque as vezes ha problemas do genero
// COntainer (Container()) or sth que não possa estar uma dentro de outra assim.. é meio cigano até se perceber
// Penso que este é pretty self explanatory..  Falta adicionar a slider bar que está exemplificada no link no songMenu

class _Panel extends State<Panel> {
  bool isPlaying() {
    return widget.playing;
  }

  String _formatDuration(Duration d) {
    if (d == null) return "--:--";
    int minute = d.inMinutes;
    int second = (d.inSeconds > 60) ? (d.inSeconds % 60) : d.inSeconds;
    String format = ((minute < 10) ? "0$minute" : "$minute") +
        ":" +
        ((second < 10) ? "0$second" : "$second");
    return format;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.zero,
      color: Colors.orange,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: songProgress(
                context, widget.duration, widget.position, widget.slider),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.shuffle,
                    color: Colors.white,
                  ),
                  onPressed: () => print("Shuffled"),
                ),
                IconButton(
                    iconSize: 36,
                    icon: Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                    ),
                    onPressed: () => AudioManager.instance.previous()),
                IconButton(
                  onPressed: () async {
                    bool playing = await AudioManager.instance.playOrPause();
                    print("await -- $playing");
                  },
                  padding: const EdgeInsets.all(0.0),
                  icon: Icon(
                    isPlaying() ? Icons.pause : Icons.play_arrow,
                    size: 48.0,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                    iconSize: 36,
                    icon: Icon(
                      Icons.skip_next,
                      color: Colors.white,
                    ),
                    onPressed: () => {
                          AudioManager.instance.next(),
                        }),
                IconButton(
                    icon: Icon(
                      Icons.stop,
                      color: Colors.white,
                    ),
                    onPressed: () => {
                          AudioManager.instance.stop(),
                          AudioManager.instance.start(
                              AudioManager.instance.info.url,
                              AudioManager.instance.info.title,
                              desc: AudioManager.instance.info.desc,
                              auto: false,
                              cover: AudioManager.instance.info.coverUrl),
                        }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget songProgress(BuildContext context, duration, position, slider) {
    Duration _duration = duration;
    Duration _position = position;
    double _slider = slider;
    var style = TextStyle(color: Colors.black);
    return Row(
      children: <Widget>[
        Text(
          _formatDuration(_position),
          style: style,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 2,
                  thumbColor: Colors.blueAccent,
                  overlayColor: Colors.blue,
                  thumbShape: RoundSliderThumbShape(
                    disabledThumbRadius: 5,
                    enabledThumbRadius: 5,
                  ),
                  overlayShape: RoundSliderOverlayShape(
                    overlayRadius: 10,
                  ),
                  activeTrackColor: Colors.blueAccent,
                  inactiveTrackColor: Colors.grey,
                ),
                child: Slider(
                  value: _slider ?? 0,
                  onChanged: (value) {
                    setState(() {
                      _slider = value;
                    });
                  },
                  onChangeEnd: (value) {
                    if (_duration != null) {
                      Duration msec = Duration(
                          milliseconds:
                              (_duration.inMilliseconds * value).round());
                      AudioManager.instance.seekTo(msec);
                    }
                  },
                )),
          ),
        ),
        Text(
          _formatDuration(_duration),
          style: style,
        ),
      ],
    );
  }
}
