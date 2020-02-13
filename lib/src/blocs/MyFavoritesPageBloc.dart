import 'package:app_peliculas/src/blocs/MoviesBloc.dart';
import 'package:app_peliculas/src/models/Movie.dart';
import 'package:app_peliculas/src/resources/LocalStorage.dart';
import 'package:app_peliculas/src/resources/SharedPref.dart';
import 'package:rxdart/rxdart.dart';

import 'BlocBase.dart';

class MyFavoritesPageBloc extends BlocBase {
  final LocalStorage _localStorage = LocalStorage();
  final PublishSubject<List<Movie>> _favoritesList = PublishSubject();
  final SharedPref _sharedPref = SharedPref();

  final MoviesBloc _moviesBloc = MoviesBloc();
  List<Movie> _list = List();

  List<String> _favoritesIDs;

  fetchFavoritesList() async {
    this._favoritesIDs = await this._localStorage.readFavorites();
    for (String favoriteID in _favoritesIDs) {
      Movie movie = await _moviesBloc.getMovieByID(favoriteID);
      _list.add(movie);
      _favoritesList.sink.add(_list);
      
    }
  }

  PublishSubject<List<Movie>> get getFavoritesList => _favoritesList.stream;

 Future<List<String>> getFavorites()async{
   List<String> favs = await _sharedPref.readFavorites();
   return favs;
  }

  deleteFavorite(Movie film){
    _sharedPref.deleteFavorite(film);
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
  }
}
