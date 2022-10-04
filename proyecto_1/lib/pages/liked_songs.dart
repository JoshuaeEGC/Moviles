import 'package:flutter/material.dart';

class Liked_songs extends StatelessWidget {
  const Liked_songs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
      ),
    );
  }
}

class Song extends StatelessWidget {
  final song;
  final String id;
  const Song({Key? key, required this.song, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Image.network(
              song.image,
              width: MediaQuery.of(context).size.width,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text("Remove from favorites"),
                                content: const Text(
                                    "This action cannot be undone. Are you sure?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Cancel")),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Confirm"))
                                ],
                              ));
                    },
                    icon: const Icon(Icons.favorite)),
                Column(
                  children: [
                    Text(song.title),
                    Text(song.artist),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
