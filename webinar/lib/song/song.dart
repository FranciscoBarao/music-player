import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:audio_manager/audio_manager.dart';
import 'package:webinar/song/songMenu.dart';

class Song extends StatelessWidget {
  var audioManagerInstance = AudioManager.instance;
  final List<SongInfo> list;
  final int index;
  Song({@required this.list, this.index});

  // Function that converts Time to MM:SS string format
  String timeFormatter(double time) {
    Duration duration = Duration(milliseconds: time.round());

    return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  @override
  Widget build(BuildContext context) {
    SongInfo song = list[index];
    //Inkwell is for clicking effects and onTap method.
    return InkWell(
      //onTap method starts music and will redirect to SongMenu() <- Fazer o redirect
      onTap: () => {},
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          margin: EdgeInsets.only(left: 10, right: 30, bottom: 0, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  // Wrap in Flexible and add overflow: TextOverFlow.ellipsis so it crops if too big -> avoids errors
                  Flexible(
                    child: Text(
                      "${song.title}",
                      style: TextStyle(
                          height: 2, fontSize: 18, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Row(
                // Divides artist and duration for design reasons
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "${song.artist}",
                      style: TextStyle(
                          height: 2, fontSize: 11, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    timeFormatter(double.parse("${song.duration}")),
                    style:
                        TextStyle(height: 1, fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
