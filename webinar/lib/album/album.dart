import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

import 'albumSongs.dart';

class Album extends StatelessWidget {
  // Audio Query package instance that allows getting music files from external storage
  final audioQuery = FlutterAudioQuery();

  final AlbumInfo album;

  Album({@required this.album});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        // Redirect to ListSong on a page with the Artist id to get songs later
        //audioQuery.getSongsFromArtist(artistId: artist.id)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumSongs(
              album: album,
            ),
          ),
        ),
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(30, 0, 30, 20),
        child: Card(
          color: Color.fromRGBO(113, 27, 51, 0.9),
          elevation: 5,
          child: Column(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // Ternary Condition -> Se for null, dá load de uma imagem dos assets
                    image: (album.albumArt == null)
                        ? AssetImage("assets/images/dog.jpg")
                        : FileImage(
                            File(
                              album.albumArt,
                            ),
                          ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "${album.title}",
                  style:
                      TextStyle(height: 2, fontSize: 20, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Center(
                child: Text(
                  "${album.artist},   ${album.numberOfSongs} Track(s)",
                  style:
                      TextStyle(height: 2, fontSize: 16, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
