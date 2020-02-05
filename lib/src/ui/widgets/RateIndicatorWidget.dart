import 'package:flutter/material.dart';

class RateIndicatorWidget extends StatelessWidget {
  final String _rate;
  const RateIndicatorWidget(this._rate);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(Icons.stars, color: Colors.yellow,),
          Text(_rate, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}