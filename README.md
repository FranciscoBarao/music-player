# music-player
Webinar's Music Player Repository

Flutter installation:  
    [Flutter install](https://flutter.dev/docs/get-started/install)

Dependencies added:  
[Flutter Audio Query](https://pub.dev/packages/flutter_audio_query/install)  

[Flutter Audio Manager](https://pub.dev/packages/audio_manager/install)  


## How to Run

To run flutter 
```
flutter run
```

To hot reload 
```
Click r on the console that is running
```

### To Change into the final Project

Rename the following files
```
 main.dart -> mainInitial.dart  
 mainFinal.dart -> main.dart
```

(Un)Comment these lines in songList.dart File  
```
//return Text("Music");  
return Song(song: list[index]);
```