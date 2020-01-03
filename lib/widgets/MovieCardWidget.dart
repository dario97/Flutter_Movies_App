import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';

class MovieCardWidget extends StatelessWidget {
  Uint8List _portada;
  MovieCardWidget(Uint8List portada) {
    this._portada = portada;
  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      child: Card(
        child: InkWell(
          onTap: () {
            print("abriendo");
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3.0),
            child: Image.memory(_portada, fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
