import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_1/pages/liked_songs.dart';
import 'package:proyecto_1/pages/recognized_song.dart';
import '../Bloc/record_bloc/record_bloc.dart';

class home_page extends StatefulWidget {
  home_page({
    Key? key,
  }) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  // Animacion del boton
  bool itsokay = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              "Toque para empezar el reconocimiento de su cancion",
              style: TextStyle(
                color: Color.fromARGB(213, 255, 255, 255),
                fontSize: 19,
              ),
            ),
          ),
          Expanded(
            child: BlocConsumer<RecordBloc, RecordState>(
              listener: (context, state) {
                if (state is RecordError) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                          "Cancion no reconozida, intente de nuevo por favor"),
                    ),
                  );
                  return;
                }
              },
              builder: ((context, state) {
                if (state is RecordLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                Widget button = Ink(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    iconSize: 150,
                    onPressed: () {
                      BlocProvider.of<RecordBloc>(context).add(
                        StartRecordingEvent(),
                      );
                    },
                    icon: Icon(
                      Icons.music_note,
                      color: Colors.blue,
                    ),
                  ),
                );
                if (state is Recording) {
                  return AvatarGlow(
                      child: button,
                      glowColor: Colors.blue,
                      endRadius: 250,
                      showTwoGlows: true);
                } else {
                  return button;
                }
              }),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Ink(
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: Colors.white,
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Liked_songs(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.favorite_sharp,
                        color: Color.fromARGB(255, 223, 6, 6),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
