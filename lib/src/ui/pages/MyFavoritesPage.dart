import 'dart:typed_data';

import 'package:app_peliculas/src/ui/widgets/FilmListTileWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class MyFavoritesPage extends StatefulWidget {
  const MyFavoritesPage({Key key}) : super(key: key);

  @override
  _MyFavoritesPageState createState() => _MyFavoritesPageState();
}

class _MyFavoritesPageState extends State<MyFavoritesPage> {
    

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      ),
      itemCount: 10,
      itemBuilder: (context, index) => FilmListTileWidget(),

    );
  }
}