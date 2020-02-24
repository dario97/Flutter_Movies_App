import 'package:app_peliculas/src/models/Director.dart';
import 'package:app_peliculas/src/models/Genre.dart';
import 'package:app_peliculas/src/models/Language.dart';
import 'package:app_peliculas/src/models/Movie.dart';
import 'package:app_peliculas/src/resources/FirestoreProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Repository {
  final _firestoreProvider = FirestoreProvider();

  Future<QuerySnapshot> getAllMovies() {
    return _firestoreProvider.getAllMovies();
  }

  Future<Movie> getMovieById(String documentID) async {
    DocumentSnapshot movieDocument =
        await _firestoreProvider.getMovieById(documentID);
    Map<String, dynamic> json = Map.from(movieDocument.data);

    return Movie.fromJson(json);
  }

  getMovieUrl(String imageName) {
    return _firestoreProvider.getMovieImageDownloadUrl(imageName);
  }

  Future<Director> getDirectorById(String documentID) async {
    DocumentSnapshot directorDocument =
        await _firestoreProvider.getDirectorById(documentID);
    Map<String, dynamic> json = directorDocument.data;
    return Director.fromJson(json);
  }

  Future<Genre> getGenreById(String documentID) async {
    DocumentSnapshot genreDocument =
        await _firestoreProvider.getGenreById(documentID);
    Map<String, dynamic> json = genreDocument.data;
    return Genre.fromJson(json);
  }

  Future<Language> getLanguageById(String documentID) async {
    DocumentSnapshot languageDocument =
        await _firestoreProvider.getLanguageById(documentID);
    Map<String, dynamic> json = languageDocument.data;
    return Language.fromJson(json);
  }
}
