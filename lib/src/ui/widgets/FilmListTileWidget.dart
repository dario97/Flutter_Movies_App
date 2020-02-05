import 'package:app_peliculas/src/ui/widgets/DataFieldWidget.dart';
import 'package:flutter/material.dart';

class FilmListTileWidget extends StatefulWidget {
  FilmListTileWidget({Key key}) : super(key: key);

  @override
  _FilmListTileWidgetState createState() => _FilmListTileWidgetState();
}

class _FilmListTileWidgetState extends State<FilmListTileWidget> {
  Size _screenSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenSize = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenSize.width,
      height: 100,
      margin: EdgeInsets.all(5),
      color: Colors.white12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildLeading(),
          SizedBox(
            width: 10,
          ),
          _buildInfo(),
        ],
      ),
    );
  }

  Widget _buildLeading() {
    return Image.asset(
      "assets/toy_story_4.jpg",
    );
  }

  Widget _buildInfo() {
    return Container(
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Toy Story 4", style: TextStyle(fontSize: 18)),
          SizedBox(
            height: 5,
          ),
          DataFieldWidget("Género", "Animada, Comedia, Niños"),
          SizedBox(
            height: 5,
          ),
          DataFieldWidget("Idioma", "Inglés"),
          SizedBox(
            height: 5,
          ),
          DataFieldWidget("Subtítulos", "Español")
        ],
      ),
    );
  }
}
