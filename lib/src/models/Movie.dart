import 'package:app_peliculas/src/models/Director.dart';
import 'package:app_peliculas/src/models/Film.dart';
import 'Language.dart';
import 'Genre.dart';

class Movie extends Film{
  String _tittle;
  int _duration;
  List<Genre> _genre;
  Language _language;
  List<Language> _subtittlesLanguage;
  double _rate;
  String _sinopsis;
  Director _director;
  int _releaseYear;
  String _imageUrl;
  String _bannerImageUrl;

  Movie.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    List<Genre> genres = List();
    List<Language> subLanguages = List();

    Map<String, dynamic> directorJson = Map.from(json['director']);
    Map<String, dynamic> languageJson = Map.from(json['language']);
    Language language = Language.fromJson(languageJson);
    Director director = Director.fromJson(directorJson);

    List genreListJson = json['genre'];
    List languageListJson = json['subtittlesLanguage'];

    for (var element in genreListJson) {
      Map<String, dynamic> genreJson = Map.from(element);
      Genre genre = Genre.fromJson(genreJson);
      genres.add(genre);
    }

    for (var element in languageListJson) {
      Map<String, dynamic> languageJson = Map.from(element);
      Language language = Language.fromJson(languageJson);
      subLanguages.add(language);
    }

    json['director'] = director;
    json['language'] = language;
    json['genre'] = genres;
    json['subtittlesLanguage'] = subLanguages;

    this._tittle = json['titulo'];
    this._duration = json['duration'];
    this._genre = List<Genre>.from(json['genre']);
    this._language = json['language'];
    this._subtittlesLanguage = List<Language>.from(json['subtittlesLanguage']);
    this._rate = json['rate'];
    this._sinopsis = json['sinopsis'];
    this._director = json['director'];
    this._releaseYear = json['releaseYear'];
    this._imageUrl = json['imageUrl'];
    this._bannerImageUrl = json['bannerImageUrl'];
  }

  Map<String, dynamic> toJson() => {
        'titulo': this._tittle,
        'duration': this._duration,
        'genre': this._genre,
        'language': this._language,
        'subtittlesLanguage': this._subtittlesLanguage,
        'rate': this._rate,
        'sinopsis': this._sinopsis,
        'director': this._director,
        'releaseYear': this._releaseYear,
        'imageUrl': this._imageUrl,
        'bannerImageUrl': this._bannerImageUrl,
      };

  // Movie(
  //     String tittle,
  //     int duration,
  //     List<Genre> genres,
  //     Language audioLanguage,
  //     List<Language> subsLanguage,
  //     double rate,
  //     String sinopsis,
  //     Director director,
  //     int releaseYear) {
  //   this._tittle = tittle;
  //   this._duration = duration;
  //   this._genre = genres;
  //   this._language = audioLanguage;
  //   this._subtittlesLanguage = subsLanguage;
  //   this._rate = rate;
  //   this._sinopsis = sinopsis;
  //   this._director = director;
  //   this._releaseYear = releaseYear;
  // }

  String get getTittle => _tittle;

  String get getImageUrl => _imageUrl;

  String get getBannerImageUrl => _bannerImageUrl;

  set setTittle(String value) => _tittle = value;

  int get getDuration => _duration;

  set setDuration(int duration) => _duration = duration;

  List get getGenres => _genre;

  set setGenres(List value) => _genre = value;

  Language get getAudioLenguage => _language;

  set setAudioLanguage(Language audioLanguage) => _language = audioLanguage;

  List<Language> get getSubsLanguage => _subtittlesLanguage;

  set setSubsLanguage(List<Language> subsLanguage) =>
      _subtittlesLanguage = subsLanguage;

  double get getRate => _rate;

  set setRate(double value) => _rate = value;

  String get getSinopsis => _sinopsis;

  set setSinopsis(String value) => _sinopsis = value;

  Director get getDirector => _director;

  set setDirectorName(Director director) => _director = director;

  int get getReleaseYear => _releaseYear;

  set setReleaseYear(int value) => _releaseYear = value;

  List<String> getMovieData() {
    List<String> movieData = List();
    movieData.add(null);
    return movieData;
  }

  bool addGenre(Genre genre) {
    if (_genre.contains(genre)) {
      return false;
    } else {
      _genre.add(genre);
      return true;
    }
  }

  bool removeGenre(Genre genre) {
    if (_genre.contains(genre)) {
      return false;
    } else {
      _genre.remove(genre);
      return true;
    }
  }
}
