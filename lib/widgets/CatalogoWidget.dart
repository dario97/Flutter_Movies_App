import 'dart:typed_data';

import 'package:app_peliculas/widgets/FilaCatalogoWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CatalogoWidget extends StatefulWidget {
  const CatalogoWidget({Key key}) : super(key: key);

  @override
  _CatalogoWidgetState createState() => _CatalogoWidgetState();
}

class _CatalogoWidgetState extends State<CatalogoWidget> {
  List<Uint8List> images = List<Uint8List>();

  @override
  void initState() { 
    super.initState();
    _downloadImages();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
      return FilaCatalogoWidget(images);
     },
    );
  }

  _downloadImages(){
    
    Firestore().collection("Peliculas").snapshots().listen((onData){
      onData.documents.forEach((doc){_descargar(doc["portada"]);});
    });
  }

  _descargar(portada)async{
    StorageReference ref = FirebaseStorage.instance.ref().child("portadas");
    Uint8List imageBytes = await ref.child(portada).getData(10*1024*1024);
    images.add(imageBytes);
  }



}
