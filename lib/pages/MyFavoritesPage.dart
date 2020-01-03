import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class MyFavoritesPage extends StatefulWidget {
  const MyFavoritesPage({Key key}) : super(key: key);

  @override
  _MyFavoritesPageState createState() => _MyFavoritesPageState();
}

class _MyFavoritesPageState extends State<MyFavoritesPage> {
  Uint8List imagesBytes;
  _MyFavoritesPageState(){
    StorageReference portadasReference = FirebaseStorage.instance.ref().child("portadas");
    List<String> imagesNames;
    
    Firestore.instance
    .collection("Peliculas")
    .snapshots()
    .listen((onData){
      for (var item in onData.documents) {
        
      }
    });
    portadasReference.child("coco.jpg").getData(10000000).then((onValue){
      setState(() {
        imagesBytes = onValue;
      });
    });
  }
    

  @override
  Widget build(BuildContext context) {

    var img = imagesBytes != null ? Image.memory(imagesBytes, fit: BoxFit.cover,) : Text("ERror");
    return ListView(children: <Widget>[
      img
    ],);
  }
}