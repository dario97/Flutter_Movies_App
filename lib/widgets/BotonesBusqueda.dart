
import 'package:flutter/material.dart';

class BotonesBusqueda extends StatelessWidget {
  BotonesBusqueda({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: _botonOrdenar,
        ),
        SizedBox(width: 5,),
        Expanded(
          child: _botonFiltrar,
        )
      ],
    );
  }

  final _botonOrdenar = SizedBox(
      height: 50,
      child: FlatButton.icon(
        color: Colors.blue,
        onPressed: () {
          print("hola");
        },
        label: Text("Ordenar"),
        icon: Icon(Icons.sort),
      ),
    );

  final _botonFiltrar = SizedBox(
      height: 50,
      child: FlatButton.icon(
        color: Colors.blue,
        onPressed: () {
          print("Chau");
        },
        label: Text("Filtrar"),
        icon: Icon(Icons.filter_list),
      ),
    );

}
