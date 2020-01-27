import 'package:app_peliculas/src/models/Movie.dart';
import 'package:app_peliculas/src/resources/FirestoreProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Repository {
  final _firestoreProvider = FirestoreProvider();

  Future<QuerySnapshot> getAllMovies() {
    return _firestoreProvider.getAllMovies();
  }

  Future<Movie> getMovieById(String documentID) async {
    DocumentSnapshot movieDocument = await _firestoreProvider.getMovieById(documentID);
    Map<String, dynamic> json = movieDocument.data;
    return Movie.fromJson(json);
  }

  getMovieUrl(String imageName) {
    return _firestoreProvider.getMovieImageDownloadUrl(imageName);
  }
}
