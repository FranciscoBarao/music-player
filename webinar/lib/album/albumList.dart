import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'album.dart';

class AlbumList extends StatelessWidget {
  final List<AlbumInfo> list;

  //Construtor onde metemos o que é required
  AlbumList({@required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Expanded é para tomar o menu todo
      child: Expanded(
        child: new ListView.builder(
          // itemCount is the number of cards, will be size(list) in the end
          itemCount: list.length,
          itemBuilder: (context, index) {
            print(list[index]);
            return Album(album: list[index]);
          },
        ),
      ),
    );
  }
}
