import 'package:flutter/material.dart';
import 'dart:convert';
import 'api.dart';
import 'details.dart';

// Vamos precisar de uma aplicação com estado
class MoviesListView extends StatefulWidget {
  @override
  _MoviesListViewState createState() => _MoviesListViewState();
}

class _MoviesListViewState extends State<MoviesListView> {
  List<Movies> movies = List<Movies>.empty(); // Lista dos filmes
  String search = "star%20trek"; // Plavra chave da pesquisa
// Construtor, atualiza com setState a lista de filmes.
  _MoviesListViewState() {
    API.getMovie(search).then((response) {
      setState(() {
        Iterable lista = json.decode(response.body); // Usamos um iterator
        movies = lista.map((model) => Movies.fromJson(model)).toList();
      });
    });
  }
// Método build sobrecarregado que vai construir nossa página
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Filmes"),
      ),
// Aqui vem nossa lista
      body: ListView.builder(
        itemCount: movies.length, // quantidade de elementos
// Os elementos da lista
        itemBuilder: (context, index) {
// Vai ser um item de lista tipo ListTile
          return ListTile(
// Uma imagem de avatar redondinho com a imagem do filme
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                movies[index].image,
              ),
            ),
// No título é o nome do filme
            title: Text(
              movies[index].name,
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
// No subtítulo colocamos o link
            subtitle: Text(movies[index].link),
// Ação de clicar
            onTap: () {
// Abrimos uma nova página, outra classe, que está no arquivo
// detail.dart. Veja que é um MaterialPageRote, tipo o
// MaterialApp, só que é só uma página nova.
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => DetailPage(movies[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
