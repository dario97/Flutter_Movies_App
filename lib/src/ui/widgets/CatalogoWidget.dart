import 'package:app_peliculas/src/ui/widgets/FilaCatalogoWidget.dart';
import 'package:flutter/material.dart';

class CatalogoWidget extends StatefulWidget {
  const CatalogoWidget({Key key}) : super(key: key);

  @override
  _CatalogoWidgetState createState() => _CatalogoWidgetState();
}

class _CatalogoWidgetState extends State<CatalogoWidget> {
  Widget fila;
  @override
  void initState() {
    super.initState();
    fila = FilaCatalogoWidget();
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
