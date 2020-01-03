import 'package:app_peliculas/main.dart';
import 'package:app_peliculas/widgets/BotonesBusqueda.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Barra de Búsqueda"),
        BotonesBusqueda(),
      ],
    );
  }
}
