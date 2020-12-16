import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

import 'artistSongs.dart';

class Artist extends StatelessWidget {
  // Audio Query package instance that allows getting music files from external storage
  final audioQuery = FlutterAudioQuery();

  final ArtistInfo artist;

  Artist({@required this.artist});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        // Redirect to ListSong on a page with the Artist id to get songs later
        //audioQuery.getSongsFromArtist(artistId: artist.id)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArtistSongs(
              artist: artist,
            ),
          ),
        ),
      },
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
                      "${artist.name}",
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
                      "${artist.numberOfAlbums} Albums",
                      style: TextStyle(
                          height: 2, fontSize: 13, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "${artist.numberOfTracks} Track(s)",
                    style:
                        TextStyle(height: 1, fontSize: 13, color: Colors.white),
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
