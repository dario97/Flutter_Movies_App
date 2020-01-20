import 'package:app_peliculas/src/ui/pages/MyFavoritesPage.dart';
import 'package:app_peliculas/src/ui/pages/SearchPage.dart';
import 'package:app_peliculas/src/ui/widgets/CatalogoWidget.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<String> _titulos = ["Catálogo", "Buscar", "Mis Favoritos"];
  
  @override
  void dispose() {
    super.dispose();
  }
  final List<Widget> _children = [
    Expanded(child: CatalogoWidget()),
    SearchPage(),
    Expanded(child: MyFavoritesPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: null,
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
          _children[_currentIndex],
        ],
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.refresh), onPressed: null,),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: _currentIndex,
        items: _buildNavigationBarItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildNavigationBarItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.book), title: Text("Catálogo")),
      BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("Buscar")),
      BottomNavigationBarItem(icon: Icon(Icons.favorite_border), title: Text("Mis Favoritos"))
    ];
  }

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
