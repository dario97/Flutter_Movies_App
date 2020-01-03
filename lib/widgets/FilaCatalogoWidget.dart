import 'dart:typed_data';
import 'package:app_peliculas/widgets/MovieCardWidget.dart';
import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FilaCatalogoWidget extends StatelessWidget {
  List<Uint8List> images;
  FilaCatalogoWidget(this.images);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              width: 400,
              child: Text(
                "TÍTULO",
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.left,
              )),
          Expanded(
            child: MoviesList(images),
          ),
        ],
      ),
    );
  }
}

class MoviesList extends StatefulWidget {
  List<Uint8List> images;
  MoviesList(this.images);

  @override
  _MoviesListState createState() => _MoviesListState(images);
}

class _MoviesListState extends State<MoviesList> {
  List<Uint8List> images;
  _MoviesListState(this.images);
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore().collection("Peliculas").snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) return Text("Cargando...");
        if (snapshot.hasError) return Text("Error");
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: snapshot.data.documents.length,
          itemBuilder: (BuildContext context, int index) {
            String nombrePortada = snapshot.data.documents[index]["portada"];
            return FutureBuilder(
              future: _downloadImage(nombrePortada),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) return Text("Cargando...");
                if (snapshot.hasError) return Text("ERROR");
                Uint8List portadaBytes = snapshot.data;
                return MovieCardWidget(portadaBytes);
              },
            );
          },
        );
      },
    );
  }

  Future<Uint8List> _downloadImage(String imageName) async {
    StorageReference ref = FirebaseStorage.instance.ref().child("portadas");
    Uint8List imageBytes;
    imageBytes = await ref.child(imageName).getData(10*1024*1024);
    return imageBytes;
  }
}
