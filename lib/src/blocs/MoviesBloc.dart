import 'package:app_peliculas/src/resources/Repository.dart';
import 'package:rxdart/rxdart.dart';

import 'BlocBase.dart';

class MoviesBloc extends BlocBase {
  final Repository _repository = Repository();
  final _movies = PublishSubject();

  fetchAllMovies() async {
    var allMovies = await _repository.getAllMovies();
    _movies.sink.add(allMovies);
  }

  Stream get allMovies => _movies.stream;
  

  @override
  void dispose() {
    _movies.close();
  }
}
