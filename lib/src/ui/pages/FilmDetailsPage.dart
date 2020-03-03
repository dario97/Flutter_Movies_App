import 'package:app_peliculas/src/blocs/FilmDetailsPageBloc.dart';
import 'package:app_peliculas/src/blocs/MoviesBloc.dart';
import 'package:app_peliculas/src/models/Film.dart';
import 'package:app_peliculas/src/models/Genre.dart';
import 'package:app_peliculas/src/models/Language.dart';
import 'package:app_peliculas/src/models/Movie.dart';
import 'package:flutter/material.dart';

class FilmDetailsPage extends StatefulWidget {
  final String _movieId;

  FilmDetailsPage(this._movieId);

  @override
  _FilmDetailsPageState createState() => _FilmDetailsPageState(_movieId);
}

class _FilmDetailsPageState extends State<FilmDetailsPage> {
  static final MoviesBloc _moviesBloc = MoviesBloc();
  static final FilmDetailsPageBloc _filmDetailsPageBloc = FilmDetailsPageBloc();
  final String _movieID;

  Future<Movie>_futureMovie;
  Movie _film;
  List<String> _movieData;
  Size _screenSize;
  bool _isLoad;

  _FilmDetailsPageState(this._movieID);

  @override
  void initState() {
    super.initState();
    _futureMovie = _moviesBloc.getMovieByID(_movieID);
    _isLoad = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenSize = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: Builder(
        builder: (context) =>  FloatingActionButton(
            child: Icon(Icons.favorite),
            onPressed: () {
              _saveFavorite();
              final snackBar = SnackBar(
                content: Text('Añadido a Mis Favoritos'),
                duration: Duration(seconds: 1),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            }),
      ),
      body: FutureBuilder(
        future: _futureMovie,
        builder: (BuildContext context, AsyncSnapshot<Movie> snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (snapshot.hasError) return Text("Error");

          _film = snapshot.data;
      
          return ListView(
            children: <Widget>[
              _buildPortada(),
              _buildHeader(),
              _buildMovieDetails(),
              _buildSinopsis(),
            ],
          );
        },
      ),
    );
  }

  void _saveFavorite() {
    _filmDetailsPageBloc.saveFavorite(_movieID);
  }

  Widget _buildPortada() {
    String imageUrl = _film.getBannerImageUrl;
    return Container(
      color: Colors.white12,
      width: _screenSize.width,
      height: 200,
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/loading.gif',
        image: imageUrl,
        fit: BoxFit.fill,
        fadeInDuration: Duration(seconds: 1),
      ),
    );
  }

  Widget _buildHeader() {
    String subLanguages = "";
    String genre = "";
    for (Language item in _film.getSubsLanguage) {
      if (item == _film.getSubsLanguage.last) {
        subLanguages += item.getLanguageName;
      } else {
        subLanguages += item.getLanguageName + " | ";
      }
    }
    for (Genre item in _film.getGenre) {
      if (item == _film.getGenre.last) {
        genre += item.getGenreName;
      } else {
        genre += item.getGenreName + " | ";
      }
    }
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              _film.getTittle,
              style: TextStyle(fontSize: 22),
              softWrap: true,
            ),
          ),
          Text(
            genre,
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            "Director: ${_film.getDirector.getName}",
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            "Idioma: ${_film.getLanguage.getLanguageName}",
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            "Subtítulos: $subLanguages",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieDetails() {
    return Container(
        width: _screenSize.width,
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buildIcons(),
        ));
  }

  List<Widget> _buildIcons() {
    return [
      _buildIconData(Icons.star_border, "${_film.getRate}"),
      _buildIconData(Icons.timer, "${_film.getDuration} min"),
      _buildIconData(Icons.calendar_today, "${_film.getReleaseYear}"),
    ];
  }

  Widget _buildIconData(IconData iconData, String data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.tealAccent,
        ),
        Text(data),
      ],
    );
  }

  Widget _buildSinopsis() {
    String synopsis = _film.getSinopsis;
    return Container(
      width: _screenSize.width,
      // height: 170,
      child: Card(
        color: Colors.white12,
        margin: EdgeInsets.all(5),
        child: Text(
          synopsis,
          softWrap: true,
        ),
      ),
    );
  }
}
