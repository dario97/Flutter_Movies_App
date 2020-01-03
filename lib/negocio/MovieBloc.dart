import 'dart:async';
import 'dart:typed_data';
import 'package:app_peliculas/negocio/Movie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase/firestore.dart';

class MovieBloc{
  final StorageReference portadasRef = FirebaseStorage.instance.ref().child("portadas");
  List<Movie> peliculas;
  final _moviesListStreamController = StreamController<List<Movie>>();

  Stream<List<Movie>> get moviesListStream => _moviesListStreamController.stream;
  StreamSink<List<Movie>> get moviesListSink => _moviesListStreamController.sink;

  // MovieBloc(){
  //   _moviesListStreamController.add();
  // }
  



  Future<Uint8List> _downloadImage()async{
  Uint8List imageBytes = await portadasRef.child("coco.jpg").getData(10000000);
  return imageBytes;
  }
}
  
  


