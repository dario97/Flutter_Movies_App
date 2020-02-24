import 'dart:convert';

import 'package:app_peliculas/src/blocs/MyFavoritesPageBloc.dart';
import 'package:app_peliculas/src/ui/widgets/FilmListTileWidget.dart';
import 'package:app_peliculas/src/models/Movie.dart';
import 'package:flutter/material.dart';

class MyFavoritesPage extends StatefulWidget {
  const MyFavoritesPage({Key key}) : super(key: key);

  @override
  _MyFavoritesPageState createState() => _MyFavoritesPageState();
}

class _MyFavoritesPageState extends State<MyFavoritesPage> {
  final MyFavoritesPageBloc _myFavoritesPageBloc = MyFavoritesPageBloc();
  Future<List<Movie>> favs;

  @override
  void initState() {
    super.initState();
    favs = _myFavoritesPageBloc.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: favs,
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        if (snapshot.hasError)
          return Center(child: Text("Error al cargar sus favoritos."));
        if (snapshot.data.isEmpty) {
          return Center(
            child: Text("No tenés favoritos."),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  background: Container(color: Colors.red, child: Icon(Icons.delete),),
                  onDismissed: (direction) {  },    
                  key: Key(snapshot.data[index].getTittle),
                  child: FilmListTileWidget(snapshot.data[index]));
            },
          );
        }
      },
    );
  }
}
