import 'package:flutter/material.dart';

class FilmDetailsPage extends StatelessWidget {
  const FilmDetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: <Widget>[
        Stack(
          
          children: <Widget>[
            Container(
              height: 250,
              width: 300,
              child: Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Image(
                    image: AssetImage("assets/toy_story_4.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
