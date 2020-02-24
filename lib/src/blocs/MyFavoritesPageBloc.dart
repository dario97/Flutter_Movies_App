import 'package:app_peliculas/src/blocs/MoviesBloc.dart';
import 'package:app_peliculas/src/models/Movie.dart';
import 'package:app_peliculas/src/resources/SharedPref.dart';
import 'package:rxdart/rxdart.dart';

import 'BlocBase.dart';

class MyFavoritesPageBloc extends BlocBase {
  final PublishSubject<List<Movie>> _favoritesList = PublishSubject();
  final SharedPref _sharedPref = SharedPref();

  final MoviesBloc _moviesBloc = MoviesBloc();
  List<Movie> _list = List();

  List<String> _favoritesIDs;

  PublishSubject<List<Movie>> get getFavoritesList => _favoritesList.stream;

 Future<List<Movie>> getFavorites()async{
   List<Movie> favs = await _sharedPref.readFavorites();
   return favs;
  }

  deleteFavorite(Movie film){
    _sharedPref.deleteFavorite(film);
  }

  deleteAllFavorites(){
    _sharedPref.deleteAllFavorites();
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
  }
}
