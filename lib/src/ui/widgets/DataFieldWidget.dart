import 'package:flutter/material.dart';

class DataFieldWidget extends StatelessWidget {
  final String _fieldName;
  final String  _data;

  DataFieldWidget(this._fieldName, this._data);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "$_fieldName: $_data",
        style: TextStyle(fontSize: 14),
        softWrap: true,
      ),
    );
  }
}