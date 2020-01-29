import 'package:app_peliculas/src/blocs/MoviesBloc.dart';
import 'package:app_peliculas/src/models/Movie.dart';
import 'package:app_peliculas/src/resources/LocalStorage.dart';
import 'package:flutter/material.dart';

class FilmDetailsPage extends StatefulWidget {
  final String _movieId;
  FilmDetailsPage(this._movieId);

  @override
  _FilmDetailsPageState createState() => _FilmDetailsPageState(_movieId);
}

class _FilmDetailsPageState extends State<FilmDetailsPage> {
  String _movieID;
  MoviesBloc _moviesBloc;
  Future<Movie> _movie;
  Size _screenSize;
  final LocalStorage _localStorage = LocalStorage();

  _FilmDetailsPageState(String movieID) {
    this._moviesBloc = MoviesBloc();
    this._movieID = movieID;
  }

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
      backgroundColor: Colors.white,
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
              _buildMovieDetails()
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  tittle,
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.stars,
                      color: Colors.blue,
                    ),
                    Text(
                      "7.5",
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
              Container(
                child: Text(
                  "Género: Acción, Superheroes, Marvel",
                  style: TextStyle(fontSize: 14),
                  softWrap: true,
                ),
              ),
            ],
          )
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

  Widget _buildMovieDetails() {
    return Container(
      width: _screenSize.width,
      height: 200,
      child: Card(
        margin: EdgeInsets.all(5),
        elevation: 2,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[Text("DURACIÓN")],
        ),
      ),
    );
  }
}
