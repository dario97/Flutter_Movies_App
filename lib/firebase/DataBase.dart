import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase{
  Firestore _firestore = Firestore.instance;

  Future<QuerySnapshot> getAllMovieDocuments(){
    return _firestore.collection("Peliculas").getDocuments();
  }
}