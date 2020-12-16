import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:webinar/album/albumList.dart';
import 'package:webinar/song/songList.dart';
import 'package:webinar/artist/artistList.dart';

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
  final audioQuery = FlutterAudioQuery();

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
