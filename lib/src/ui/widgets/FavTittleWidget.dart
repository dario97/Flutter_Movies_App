import 'package:flutter/material.dart';

class FavTittleWidget extends StatefulWidget {
  @override
  _FavTittleWidgetState createState() => _FavTittleWidgetState();
}

class _FavTittleWidgetState extends State<FavTittleWidget> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.blue),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "COCO",
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          Spacer(),
          IconButton(
              onPressed: () {
                _setFav();
              },
              icon: !isFav
                  ? Icon(
                      Icons.favorite_border,
                      color: Colors.blue,
                    )
                  : Icon(
                      Icons.favorite,
                      color: Colors.blue,
                    ))
        ],
      ),
    );
  }

  void _setFav() {
    setState(() {
      if (!isFav) {
        isFav = true;
      } else {
        isFav = false;
      }
    });
  }
}
