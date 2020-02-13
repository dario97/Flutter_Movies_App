import 'package:app_peliculas/src/blocs/MyFavoritesPageBloc.dart';
import 'package:app_peliculas/src/models/Movie.dart';
import 'package:app_peliculas/src/ui/widgets/DataFieldWidget.dart';
import 'package:flutter/material.dart';

class FilmListTileWidget extends StatefulWidget {
  final Movie _movie;
  FilmListTileWidget(this._movie);

  @override
  _FilmListTileWidgetState createState() => _FilmListTileWidgetState(_movie);
}

class _FilmListTileWidgetState extends State<FilmListTileWidget> {
  Size _screenSize;
  final Movie _movie;
  final MyFavoritesPageBloc _favoritesPageBloc = MyFavoritesPageBloc();

  _FilmListTileWidgetState(this._movie);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenSize = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenSize.width,
      height: 100,
      margin: EdgeInsets.all(5),
      color: Colors.white12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildLeading(),
          Spacer(),
          _buildInfo(),
          Spacer(),
          IconButton(icon: Icon(Icons.delete), onPressed: () {
            _deleteFavorite();
          })
        ],
      ),
    );
  }

  void _deleteFavorite() {
    _favoritesPageBloc.deleteFavorite(_movie);
  }

  Widget _buildLeading() {
    return Image.network(_movie.getImageUrl);
  }

  Widget _buildInfo() {
    return Container(
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_movie.getTittle, style: TextStyle(fontSize: 18)),
          SizedBox(
            height: 5,
          ),
          DataFieldWidget("Género", "Animada, Comedia, Niños"),
          SizedBox(
            height: 5,
          ),
          DataFieldWidget("Idioma", "Inglés"),
          SizedBox(
            height: 5,
          ),
          DataFieldWidget("Subtítulos", "Español")
        ],
      ),
    );
  }
}
