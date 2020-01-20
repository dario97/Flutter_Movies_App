import 'package:app_peliculas/src/blocs/MoviesBloc.dart';
import 'package:flutter/material.dart';

class FilmDetailsPage extends StatefulWidget {
  String _movieId;
  FilmDetailsPage(String movieId) {
    this._movieId = movieId;
  }

  @override
  _FilmDetailsPageState createState() => _FilmDetailsPageState(_movieId);
}

class _FilmDetailsPageState extends State<FilmDetailsPage> {
  String _movieID;
  MoviesBloc _moviesBloc;
  var _movieStream;
  _FilmDetailsPageState(String movieID) {
    this._moviesBloc = MoviesBloc();
    this._movieID = movieID;
  }

  @override
  void initState() {
    super.initState();
    _movieStream = _moviesBloc.getMovieByID(_movieID);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: null,
      ),
      body: StreamBuilder(
          stream: _movieStream,
          builder: (context, snapshot) {
            String url = snapshot.data.document["imageUrl"];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildPortada(screenSize.width, url),
                _buildHeader(),
                _buildSinopsis(screenSize.width),
                _buildMovieDetails(screenSize.width)
              ],
            );
          }),
    );
  }

  Widget _buildPortada(double screenWidth, String imageUrl) {
    return Container(
      width: screenWidth,
      child: Image.network(
        imageUrl,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _buildHeader() {
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
                  "Avengers: Infinity War",
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

  Widget _buildSinopsis(screenWidth) {
    return Container(
      width: screenWidth,
      height: 170,
      child: Card(
        margin: EdgeInsets.all(5),
        child: Text(
          "Los superhéroes se alían para vencer al poderoso Thanos, el peor enemigo al que se han enfrentado. Si Thanos logra reunir las seis gemas del infinito: poder, tiempo, alma, realidad, mente y espacio, nadie podrá detenerlo.",
          softWrap: true,
        ),
      ),
    );
  }

  Widget _buildMovieDetails(double screenWidth) {
    return Container(
      width: screenWidth,
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
