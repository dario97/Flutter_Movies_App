import 'package:app_peliculas/src/ui/pages/MyFavoritesPage.dart';
import 'package:app_peliculas/src/ui/pages/SearchPage.dart';
import 'package:app_peliculas/src/ui/pages/CatalogPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _titulos = ["Catálogo", "Buscar", "Mis Favoritos"];
  final List<Widget> _children = [
    CatalogPage(),
    SearchPage(),
    MyFavoritesPage()
  ];

  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        centerTitle: true,
        title: Text(
          _titulos[_currentIndex],
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: _children[_currentIndex],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: _currentIndex,
        items: _buildNavigationBarItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildNavigationBarItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.book), title: Text(_titulos[0])),
      BottomNavigationBarItem(icon: Icon(Icons.search), title: Text(_titulos[1])),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border), title: Text(_titulos[2]))
    ];
  }

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
