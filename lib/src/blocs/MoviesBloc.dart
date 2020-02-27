import 'package:app_peliculas/src/models/Movie.dart';
import 'package:app_peliculas/src/resources/Repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

import 'BlocBase.dart';

class MoviesBloc extends BlocBase {
  final Repository _repository = Repository();
  final PublishSubject<QuerySnapshot> _movies = PublishSubject();

  fetchAllMovies() async {
    var allMovies = await _repository.getAllMovies();
    if(!_movies.isClosed){
      _movies.sink.add(allMovies);
    }
  }

  PublishSubject<QuerySnapshot> get getAllMovies => _movies.stream;

  Future<Movie> getMovieByID(movieID) async {
    Movie movie = await _repository.getMovieById(movieID);
    return movie;
  }

  @override
  void dispose() {
    _movies.close();
  }
}
