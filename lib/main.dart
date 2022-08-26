import 'package:flutter/material.dart';
import 'movie.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      title: 'Lendo API de Filmes',
      home: MoviesListView(),
    );
  }
}
