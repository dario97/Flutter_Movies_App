import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreProvider {
  final Firestore _firestore = Firestore.instance;
  final StorageReference _storageReference =
      FirebaseStorage.instance.ref().child("portadas");

  Future<QuerySnapshot> getAllMovies() {
    return _firestore.collection("Peliculas").getDocuments();
  }
  
  Future<DocumentSnapshot> getMovieById(String documentID) {
    return _firestore.collection("Peliculas").document(documentID).get();
  }

  getMovieImageDownloadUrl(String imageName) async {
    String downloadUrl =
        await _storageReference.child(imageName).getDownloadURL();
    return downloadUrl;
  }

  Future<DocumentSnapshot> getDirectorById(String documentID){
    return _firestore.collection("Director").document(documentID).get();
  }

  Future<DocumentSnapshot> getGenreById(String documentID){
    return _firestore.collection("Genre").document(documentID).get();
  }

  Future<DocumentSnapshot> getLanguageById(String documentID){
    return _firestore.collection("Language").document(documentID).get();
  }


}
