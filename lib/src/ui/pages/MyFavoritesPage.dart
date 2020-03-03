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
  int _counter;
  Future<List<Movie>> _favs;

  @override
  void initState() {
    super.initState();
    _favs = _myFavoritesPageBloc.getFavorites();
  }

  void _deleteFavorite(film) {
    _myFavoritesPageBloc.deleteFavorite(film);
  }

  void _decCounter() {
    if (_counter > 0) {
      _counter--;
    }
  }

  void _dismissFav() {
    _decCounter();
    if (_counter == 0) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _favs,
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        if (snapshot.hasError)
          return Center(child: Text("Error al cargar sus favoritos."));
        if (snapshot.data.isEmpty || _counter == 0) {
          return Center(
            child: Text("Oops, no tenés favoritos."),
          );
        } else {
          _counter = snapshot.data.length;
          return ListView.builder(
            itemCount: _counter,
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
                    _dismissFav();
                  },
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  child: FilmListTileWidget(snapshot.data[index]));
            },
          );
        }
      },
    );
  }
}
