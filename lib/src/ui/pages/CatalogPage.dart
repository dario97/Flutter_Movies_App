import 'package:app_peliculas/src/blocs/MoviesBloc.dart';
import 'package:app_peliculas/src/ui/widgets/FilaCatalogoWidget.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key key}) : super(key: key);

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final _bloc = MoviesBloc();
  Widget fila;
  
  @override
  void initState() {
    super.initState();
    _bloc.fetchAllMovies();
    fila = FilaCatalogoWidget(_bloc.allMovies);
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      cacheExtent: 650,
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return fila;
      },
    );
  }
}