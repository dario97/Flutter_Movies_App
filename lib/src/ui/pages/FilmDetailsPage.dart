
import 'package:app_peliculas/src/ui/widgets/FavTittleWidget.dart';
import 'package:flutter/material.dart';

class FilmDetailsPage extends StatelessWidget {
  String movieId;
  FilmDetailsPage(String movieId) {
    this.movieId = movieId;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.favorite), onPressed: null,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(flex: 4, child: _buildPortada(screenSize.width)),
          _buildHeader(),
          
          Expanded(
            flex: 6,
            child: _buildSinopsis(),
          )
        ],
      ),
    );
  }

  Widget _buildPortada(screenWidth) {
    
    return Container(
      width: screenWidth,
        child: Image.asset(
          "assets/avengers-banner.jpg",
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
                    Icon(Icons.stars, color: Colors.blue,),
                    Text("8.5", style: TextStyle(fontSize: 16),)
                  ],
                ),
              ),
              Container(
                child: Text("Estreno: 28/5/2018", style: TextStyle(fontSize: 16),),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSinopsis() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Card(
        margin: EdgeInsets.all(5),
        child: Text("Los superhéroes se alían para vencer al poderoso Thanos, el peor enemigo al que se han enfrentado. Si Thanos logra reunir las seis gemas del infinito: poder, tiempo, alma, realidad, mente y espacio, nadie podrá detenerlo.",
          softWrap: true,
        ),
      ),
    );
  }

  Widget _buildMovieDetails() {
    return AspectRatio(
      aspectRatio: 16 / 9,
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
