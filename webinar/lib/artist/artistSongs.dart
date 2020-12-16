import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:webinar/song/songList.dart';

class ArtistSongs extends StatelessWidget {
  // Audio Query package instance that allows getting music files from external storage
  final audioQuery = FlutterAudioQuery();

  final ArtistInfo artist;
  ArtistSongs({@required this.artist});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Defines background Color and Gradient
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          tileMode: TileMode.repeated,
          stops: [0.0, 1.0],
          colors: [
            Color.fromRGBO(9, 32, 63, 0.9),
            Color.fromRGBO(83, 120, 149, 0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(113, 27, 51, 0.9),
          title: Text('${artist.name}'),
        ),
        body: Column(
          // Push Loading to the Center
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
                future: audioQuery.getSongsFromArtist(artistId: artist.id),
                builder: (context, snapshot) {
                  List<SongInfo> listSongs = snapshot.data;
                  if (!(listSongs == null) && listSongs.isNotEmpty)
                    return SongList(list: listSongs);
                  return Center(
                    child: Text(
                      "Loading..",
                      style: TextStyle(
                          height: 1, fontSize: 25, color: Colors.white),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
