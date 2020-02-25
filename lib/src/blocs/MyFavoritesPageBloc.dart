import 'package:app_peliculas/src/models/Movie.dart';
import 'package:app_peliculas/src/resources/SharedPref.dart';

import 'BlocBase.dart';

class MyFavoritesPageBloc extends BlocBase {
  final SharedPref _sharedPref = SharedPref();

  Future<List<Movie>> getFavorites() async {
    List<Movie> favs = await _sharedPref.readFavorites();
    return favs;
  }

  deleteFavorite(Movie film) {
    _sharedPref.deleteFavorite(film);
  }

  deleteAllFavorites() {
    _sharedPref.deleteAllFavorites();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
