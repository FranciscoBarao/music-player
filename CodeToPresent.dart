/*
---------------------------------------------------------------CÓDIGO BASE---------------------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:webinar/albumList.dart';
import 'package:webinar/songList.dart';
import 'package:webinar/artistList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Audio Query package instance that allows getting music files from external storage
  //final audioQuery = FlutterAudioQuery();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        // Number of Tabs
        length: 3,
        child: Container(
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
              backgroundColor: Color.fromRGBO(113, 27, 51, 1),
              bottom: TabBar(
                tabs: [
                  Tab(text: "Tracks"),
                  Tab(text: "Artist"),
                  Tab(text: "Albums"),
                ],
              ),
              title: Text('Music Player'),
            ),
            body: TabBarView(
              children: [
                Text("Tab 1"),
                Text("Tab 2"),
                Text("Tab 3"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
----------------------------------------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------Conteudo de Tab Música----------------------------------------------------------------


Column(
  // Push Loading to the Center
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    FutureBuilder(
        future: audioQuery.getSongs(),
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

----------------------------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------Conteudo de Tab Artista----------------------------------------------------------------


// Artist Set
                Column(
                  // Push Loading to the Center
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FutureBuilder(
                        future: audioQuery.getArtists(),
                        builder: (context, snapshot) {
                          List<ArtistInfo> listArtist = snapshot.data;
                          if (!(listArtist == null) && listArtist.isNotEmpty)
                            return ArtistList(list: listArtist);
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

----------------------------------------------------------------------------------------------------------------------------------------------------------




-------------------------------------------------------------------Conteudo de Tab Album----------------------------------------------------------------


// Album Set
  Column(
    // Push Loading to the Center
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      FutureBuilder(
          future: audioQuery.getAlbums(),
          builder: (context, snapshot) {
            List<AlbumInfo> listAlbums = snapshot.data;
            if (!(listAlbums == null) && listAlbums.isNotEmpty)
              return AlbumList(list: listAlbums);
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

----------------------------------------------------------------------------------------------------------------------------------------------------------





--------------------------------------------------------------------onTap -> Colocar uma musica a dar----------------------------------------------------------------

Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SongMenu(list: list, index: index))),
*/
