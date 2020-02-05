import 'package:app_peliculas/src/blocs/MoviesBloc.dart';
import 'package:app_peliculas/src/models/Movie.dart';
import 'package:app_peliculas/src/resources/LocalStorage.dart';
import 'package:app_peliculas/src/ui/widgets/DataFieldWidget.dart';
import 'package:app_peliculas/src/ui/widgets/RateIndicatorWidget.dart';
import 'package:flutter/material.dart';

class FilmDetailsPage extends StatefulWidget {
  final String _movieId;

  FilmDetailsPage(this._movieId);

  @override
  _FilmDetailsPageState createState() => _FilmDetailsPageState(_movieId);
}

class _FilmDetailsPageState extends State<FilmDetailsPage> {
  final MoviesBloc _moviesBloc = MoviesBloc();
  final LocalStorage _localStorage = LocalStorage();
  final String _movieID;

  Future<Movie> _movie;
  Size _screenSize;

  _FilmDetailsPageState(this._movieID);

  @override
  void initState() {
    super.initState();
    _movie = _moviesBloc.getMovieByID(_movieID);
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
        builder: (context) => FloatingActionButton(
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
        future: _movie,
        builder: (BuildContext context, AsyncSnapshot<Movie> snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (snapshot.hasError) return Text("Error");
          String bannerImageUrl = snapshot.data.getBannerImageUrl;
          String sinopsis = snapshot.data.getSinopsis;
          String tittle = snapshot.data.getTittle;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildPortada(bannerImageUrl),
              _buildHeader(tittle),
              _buildSinopsis(sinopsis),
            ],
          );
        },
      ),
    );
  }

  void _saveFavorite() {
    _localStorage.writeFavorite(_movieID);
  }

  Widget _buildPortada(String imageUrl) {
    return Container(
      width: _screenSize.width,
      height: 200,
      child: Image.network(
        imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildHeader(String tittle) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              tittle,
              style: TextStyle(fontSize: 22),
              softWrap: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RateIndicatorWidget("7.5"),
              SizedBox(
                width: 5,
              ),
              DataFieldWidget("Género", "Animada, Acción, Superheroes")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DataFieldWidget("Estreno", "2018"),
              SizedBox(
                width: 5,
              ),
              DataFieldWidget("Duración", "180min"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DataFieldWidget("Idioma", "Inglés"),
              SizedBox(
                width: 5,
              ),
              DataFieldWidget("Subtítulos", "Español, Inglés")
            ],
          ),
          DataFieldWidget("Director", "Darío Emanuel Márquez")
        ],
      ),
    );
  }

  Widget _buildSinopsis(String sinopsis) {
    return Container(
      width: _screenSize.width,
      height: 170,
      child: Card(
        margin: EdgeInsets.all(5),
        child: Text(
          sinopsis,
          softWrap: true,
        ),
      ),
    );
  }
}
