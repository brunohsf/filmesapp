import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'api.dart';

// Uma página para mostrar os detalhes de cada filme. Passamos o objeto
// do filme como parâmetro no constructor
class DetailPage extends StatelessWidget {
  final Movies movie;
  DetailPage(this.movie);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.name),
      ),
      body: Container(
        padding: new EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
              child: Image(
                image: NetworkImage(
                  movie.image,
                ),
              ),
            ),
            Text("Link:"),
// Aqui a gente coloca um link clicável.
            Linkify(
              onOpen: (link) async {
                if (await canLaunch(movie.link)) {
                  await launch(movie.link);
                } else {
                  throw 'Não foi possível abrir {$movie.link}';
                }
              },
              text: movie.link,
            ),
          ],
        ),
      ),
    );
  }
}
