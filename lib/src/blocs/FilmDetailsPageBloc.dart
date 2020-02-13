import 'package:app_peliculas/src/blocs/BlocBase.dart';
import 'package:app_peliculas/src/blocs/MoviesBloc.dart';
import 'package:app_peliculas/src/models/Movie.dart';
import 'package:app_peliculas/src/resources/SharedPref.dart';

class FilmDetailsPageBloc extends BlocBase {
  final SharedPref _sharedPref = SharedPref();
  final MoviesBloc _moviesBloc = MoviesBloc();

  void saveFavorite(String filmID) async {
    Movie movie = await _moviesBloc.getMovieByID(filmID);
    _sharedPref.saveFavorite(movie);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
