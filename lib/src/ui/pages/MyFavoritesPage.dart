import 'dart:convert';

import 'package:app_peliculas/src/blocs/MyFavoritesPageBloc.dart';
import 'package:app_peliculas/src/resources/LocalStorage.dart';
import 'package:app_peliculas/src/ui/widgets/FilmListTileWidget.dart';
import 'package:app_peliculas/src/models/Movie.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MyFavoritesPage extends StatefulWidget {
  const MyFavoritesPage({Key key}) : super(key: key);

  @override
  _MyFavoritesPageState createState() => _MyFavoritesPageState();
}

class _MyFavoritesPageState extends State<MyFavoritesPage> {
  final MyFavoritesPageBloc _myFavoritesPageBloc = MyFavoritesPageBloc();
  Future<List<String>> favs;

  @override
  void initState() {
    super.initState();
    favs = _myFavoritesPageBloc.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: favs,
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (!snapshot.hasData) return Center(child: Text(""));
        if (snapshot.hasError)
          return Center(child: Text("Error al cargar sus favoritos."));
        List<Movie> favs = List();
        for (String item in snapshot.data) {
          Map fav = json.decode(item);
          Movie film = Movie.fromJson(fav);
          favs.add(film);
        }
        if (favs.isEmpty) {
          return Center(
            child: Text("No tenés favoritos."),
          );
        } else {
          return ListView.builder(
            itemCount: favs.length,
            itemBuilder: (BuildContext context, int index) {
              return FilmListTileWidget(favs[index]);
            },
          );
        }
      },
    );
  }
}
