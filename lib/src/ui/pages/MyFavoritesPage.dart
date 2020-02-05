

import 'package:app_peliculas/src/resources/LocalStorage.dart';
import 'package:app_peliculas/src/ui/widgets/FilmListTileWidget.dart';
import 'package:flutter/material.dart';

class MyFavoritesPage extends StatefulWidget {
  const MyFavoritesPage({Key key}) : super(key: key);

  @override
  _MyFavoritesPageState createState() => _MyFavoritesPageState();
}

class _MyFavoritesPageState extends State<MyFavoritesPage> {
  final LocalStorage _localStorage = LocalStorage();
  List<String> _favorites;
    
  @override
  void initState() { 
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
      return FilmListTileWidget();
     },
    );
  }
}