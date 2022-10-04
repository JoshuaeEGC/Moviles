import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import 'package:record/record.dart';

part 'record_event.dart';
part 'record_state.dart';

class RecordBloc extends Bloc<RecordEvent, RecordState> {
  final recorder = Record();

  RecordBloc()
      : super(
          RecordInitial(),
        ) {
    on<StartRecordingEvent>(startRecording);
  }

  Future<void> startRecording(StartRecordingEvent event, emit) async {
    try {
      if (await recorder.hasPermission()) {
        await recorder.start();
        await Future.delayed(Duration(seconds: 4));
        final String? path = await recorder.stop();

        if (path == null) {
          emit(RecordError());
          return;
        }

        File send = File(path);

        String converterBytes = base64Encode(
          send.readAsBytesSync(),
        );
        final info = await recognizedSongData(converterBytes);

        final songData = {
          "artist": info["artist"],
          "title": info["title"],
          "album": info["album"],
          "release_date": info["release_date"],
          "apple_music": info["apple_music"],
          "spotify": info["spotify"]["external_urls"]["spotify"],
          "song_link": info["song_link"],
          "albumImage": info["spotify"]["album"]["images"][0]["url"],
        };
        print(songData);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> recognizedSongData(String converterBytes) async {
    final Uri API = Uri.parse("https://api.audd.io/");
    Map<String, String> url = {
      'api_token': '',
      'audio': converterBytes,
      'return': 'apple_music,spotify',
    };
    try {
      final response = await http.post(API, body: url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body)["result"];
      }
    } catch (e) {}
  }
}
