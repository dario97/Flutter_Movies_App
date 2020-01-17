import 'package:app_peliculas/src/resources/FirestoreProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Repository {
  final _firestoreProvider = FirestoreProvider();

  Future<QuerySnapshot> getAllMovies() {
    return _firestoreProvider.getAllMovies();

  }

  Stream<DocumentSnapshot> getMovieById(String documentID) {
    return _firestoreProvider.getMovieById(documentID);
  }

  getMovieUrl(String imageName){
    return _firestoreProvider.getMovieImageDownloadUrl(imageName);
  }
}
