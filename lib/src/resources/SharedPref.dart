import 'dart:convert';
import 'package:app_peliculas/src/models/Movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<bool> saveFavorite(Movie film) async {
    final String filmEncode = json.encode(film);
    final SharedPreferences sp = await SharedPreferences.getInstance();
    List<String> favorites;

    if (sp.containsKey("favorites")) {
      favorites = sp.getStringList("favorites");
      if (favorites.contains(filmEncode)) {
        return false;
      } else {
        favorites.add(filmEncode);
        _save("favorites", favorites, sp);
        return true;
      }
    } else {
      favorites = List();
      favorites.add(filmEncode);
      _save("favorites", favorites, sp);
      return true;
    }
  }

  Future<List<Movie>> readFavorites() async {
    List<String> favorites = await _read("favorites");
    List<Movie> filmsFavorites = List();
    for (String item in favorites) {
      Map<String, dynamic> favorite = json.decode(item);
      Movie film = Movie.fromJson(favorite);
      filmsFavorites.add(film);
    }

    return filmsFavorites;
  }

  deleteFavorite(Movie film) async {
    final String filmEncode = json.encode(film);
    final SharedPreferences sp = await SharedPreferences.getInstance();
    List<String> favorites = sp.getStringList("favorites");
    favorites.remove(filmEncode);
    _save("favorites", favorites, sp);
  }

  void deleteAllFavorites() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("favorites");
  }

  void _save(String key, List<String> value, SharedPreferences sp) {
    sp.setStringList(key, value);
  }

  Future<List<String>> _read(String key) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    List<String> list = List();

    try {
      list = sp.getStringList(key);
      return list;
    } catch (e) {
      return list;
    }
  }
}
