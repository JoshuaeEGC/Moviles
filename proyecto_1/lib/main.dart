import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_1/Bloc/record_bloc/record_bloc.dart';
import 'package:proyecto_1/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => RecordBloc(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FindTrackApp',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        primaryColor: Colors.purple,
        primarySwatch: Colors.purple,
      ),
      home: home_page(),
    );
  }
}
