import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:webinar/song/song.dart';
import 'package:webinar/song/songMenu.dart';

class SongList extends StatelessWidget {
  final List<SongInfo> list;

  //Construtor onde metemos o que é required
  SongList({@required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Expanded é para tomar o menu todo
      child: Expanded(
        child: new ListView.builder(
          // itemCount is the number of cards, will be size(list) in the end
          itemCount: list.length,
          itemBuilder: (context, index) {
            if (list[index].displayName.contains(".mp3")) return Text("Music");
            // return Song(list: list, index: index);
            // Serve para ele ir dando load aos batches.. precisa de um return senão não dá load de mais batches.
            return Text(
              "",
            );
          },
        ),
      ),
    );
  }
}
