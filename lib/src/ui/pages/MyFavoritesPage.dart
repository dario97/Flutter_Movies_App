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

  void _deleteFavorite(film) {
    _myFavoritesPageBloc.deleteFavorite(film);
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
            child: Text("Tu lista está vacia."),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  background: Container(
                      color: Colors.redAccent,
                      child: Row(
                        children: <Widget>[
                          Spacer(),
                          Container(
                              margin: EdgeInsets.all(10),
                              child: Row(
                                children: <Widget>[
                                  Text("ELIMINAR"),
                                  Icon(Icons.delete),
                                ],
                              ))
                        ],
                      )),
                  onDismissed: (DismissDirection direction) {
                    _deleteFavorite(snapshot.data[index]);
                  },
                  key: Key(snapshot.data[index].getTittle),
                  direction: DismissDirection.endToStart,
                  child: FilmListTileWidget(snapshot.data[index]));
            },
          );
        }
      },
    );
  }
}
