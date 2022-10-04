import 'package:flutter/material.dart';

class RecognizedSong extends StatefulWidget {
  final Map<String, dynamic> info;
  RecognizedSong({Key? key, required this.info}) : super(key: key);

  @override
  State<RecognizedSong> createState() => _RecognizedSongState();
}

class _RecognizedSongState extends State<RecognizedSong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Esta es tu cancion"),
      ),
      body: Column(children: [
        Image.network(
          widget.info["albumImage"].toString(),
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: EdgeInsets.only(top: 13.0),
          child: Text(
            widget.info["title"].toString(),
            style: TextStyle(
              fontSize: 2,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          widget.info["album"].toString(),
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        Text(
          widget.info["artist"].toString(),
          style: TextStyle(
            fontWeight: FontWeight.w100,
            color: Colors.white,
          ),
        ),
        Text(
          widget.info["release_ate"].toString(),
          style: TextStyle(
            fontWeight: FontWeight.w100,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (() => (widget.info["spotify"].toString())),
                child: Image.asset(
                  "https://png.pngtree.com/element_our/png_detail/20181011/spotify-social-media-icon-design-template-vector-png_127005.jpg",
                  height: 50,
                  width: 50,
                ),
              ),
              GestureDetector(
                onTap: (() => (widget.info["apple_music"].toString())),
                child: Image.asset(
                  "https://w7.pngwing.com/pngs/726/970/png-transparent-itunes-store-apple-music-music-apple-purple-music-video-os-x.png",
                  height: 50,
                  width: 50,
                ),
              ),
              GestureDetector(
                onTap: (() => (widget.info["linktree"].toString())),
                child: Image.asset(
                  "https://img.icons8.com/color/480/linktree.png",
                  height: 50,
                  width: 50,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
