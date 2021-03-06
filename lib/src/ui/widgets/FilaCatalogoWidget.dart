import 'package:app_peliculas/src/blocs/MoviesBloc.dart';
import 'package:app_peliculas/src/ui/widgets/MovieCardWidget.dart';
import 'package:flutter/material.dart';

class FilaCatalogoWidget extends StatefulWidget {
  FilaCatalogoWidget();

  @override
  _FilaCatalogoWidgetState createState() => _FilaCatalogoWidgetState();
}

class _FilaCatalogoWidgetState extends State<FilaCatalogoWidget> {
  final _bloc = MoviesBloc();

  @override
  void initState() {
    super.initState();
    _bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  _buildMoviesStream() {
    return _bloc.allMovies;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              width: 400,
              child: Text(
                "TÍTULO",
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.left,
              )),
          Expanded(
            child: StreamBuilder(
              stream: _buildMoviesStream(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) return Text("Cargando...");
                if (snapshot.hasError) return Text("Error");
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    String docID = snapshot.data.documents[index].documentID;
                    String url = snapshot.data.documents[index]["imageUrl"];
                    return MovieCardWidget(url, docID);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
