import 'Language.dart';
import 'Genre.dart';

class Pelicula {
  String _tittle;
  DateTime _duration;
  List<Genre> _genres;
  Language _audioLanguage;
  Language _subsLanguage;
  String _rate;
  String _sinopsis;
  String _directorName;
  String _releaseYear;

  Pelicula(
      String tittle,
      DateTime duration,
      List<Genre> genres,
      Language audioLanguage,
      Language subsLanguage,
      String rate,
      String sinopsis,
      String directorName,
      String releaseYear) {
    this._tittle = tittle;
    this._duration = duration;
    this._genres = genres;
    this._audioLanguage = audioLanguage;
    this._subsLanguage = subsLanguage;
    this._rate = rate;
    this._sinopsis = sinopsis;
    this._directorName = directorName;
    this._releaseYear = releaseYear;
  }

  String get getTittle => _tittle;

  set setTittle(String value) => _tittle = value;

  DateTime get getDuration => _duration;

  set setDuration(DateTime duration) => _duration = duration;

  List get getGenres => _genres;

  set setGenres(List value) => _genres = value;

  Language get getAudioLenguage => _audioLanguage;

  set setAudioLanguage(Language audioLanguage) => _audioLanguage = audioLanguage;

  Language get getSubsLanguage => _subsLanguage;

  set setSubsLanguage(Language subsLanguage) => _subsLanguage = subsLanguage;

  String get getRate => _rate;

  set setRate(String value) => _rate = value;

  String get getSinopsis => _sinopsis;

  set setSinopsis(String value) => _sinopsis = value;

  String get getDirectorName => _directorName;

  set setDirectorName(String value) => _directorName = value;

  String get getReleaseYear => _releaseYear;

  set setReleaseYear(String value) => _releaseYear = value;

  bool addGenre(Genre genre) {
    if (_genres.contains(genre)) {
      return false;
    } else {
      _genres.add(genre);
      return true;
    }
  }

  bool removeGenre(Genre genre) {
    if (_genres.contains(genre)) {
      return false;
    } else {
      _genres.remove(genre);
      return true;
    }
  }
}
