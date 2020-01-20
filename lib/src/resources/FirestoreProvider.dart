import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;
  var _storageReference = FirebaseStorage.instance.ref().child("portadas");

  Future<QuerySnapshot> getAllMovies() {
    return _firestore.collection("Peliculas").getDocuments();
  }

  Stream<DocumentSnapshot> getMovieById(String documentID) {
    return _firestore.collection("Peliculas").document(documentID).snapshots();
  }

    getMovieImageDownloadUrl(String imageName) async {
    String downloadUrl = await _storageReference.child(imageName).getDownloadURL();
    return downloadUrl;
    
  }
}
