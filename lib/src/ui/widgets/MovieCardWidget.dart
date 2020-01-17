import 'dart:ui';
import 'package:app_peliculas/src/ui/pages/FilmDetailsPage.dart';
import 'package:flutter/material.dart';

class MovieCardWidget extends StatefulWidget {
  String imageUrl;
  String movieID;
  MovieCardWidget(this.imageUrl, this.movieID);

  @override
  _MovieCardWidgetState createState() =>
      _MovieCardWidgetState(imageUrl, movieID);
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  String imageUrl;
  String movieID;
  Widget image;
  _MovieCardWidgetState(this.imageUrl, this.movieID);

  @override
  void initState() {
    super.initState();
    image = Image.network(imageUrl, fit: BoxFit.fill);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FilmDetailsPage(movieID)));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3.0),
            child: image,
          ),
        ),
      ),
    );
  }
}
