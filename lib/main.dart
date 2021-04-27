import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import './blocs/bloc_observer.dart';
import './util/router.dart' as router;

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie Exploration",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.playfairDisplayTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: Colors.blueGrey[900]
          )
        ),
      ),
      onGenerateRoute: router.generateRoute,
    );
  }
}