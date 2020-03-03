import 'package:app_peliculas/src/models/Director.dart';
import 'package:app_peliculas/src/models/Film.dart';
import 'Language.dart';
import 'Genre.dart';

class Movie implements Film {
  String _tittle;
  int _duration;
  Director _director;
  List<Genre> _genre;
  Language _language;
  List<Language> _subtittlesLanguage;
  double _rate;
  String _sinopsis;
  int _releaseYear;
  String _imageUrl;
  String _bannerImageUrl;

  Movie.fromJson(Map<String, dynamic> json) {
    List listL = json['subtittlesLanguage'];
    List listG = json['genre'];

    Map<String, dynamic> directorJson = Map.from(json['director']);
    Map<String, dynamic> languageJson = Map.from(json['language']);

    List<Genre> genresList = listG.map((i) {
      Map<String, dynamic> genreJson = Map.from(i);
      return Genre.fromJson(genreJson);
    }).toList();

    List<Language> subLanguagesList = listL.map((i) {
      Map<String, dynamic> languageJson = Map.from(i);
      return Language.fromJson(languageJson);
    }).toList();

    this._tittle = json['titulo'];
    this._duration = json['duration'];
    this._director = Director.fromJson(directorJson);
    this._genre = genresList;
    this._language = Language.fromJson(languageJson);
    this._subtittlesLanguage = subLanguagesList;
    this._rate = json['rate'];
    this._sinopsis = json['sinopsis'];
    this._releaseYear = json['releaseYear'];
    this._imageUrl = json['imageUrl'];
    this._bannerImageUrl = json['bannerImageUrl'];
  }

  Map<String, dynamic> toJson() => {
        'titulo': this._tittle,
        'genre': this._genre,
        'director': this._director,
        'duration': this._duration,
        'language': this._language,
        'subtittlesLanguage': this._subtittlesLanguage,
        'rate': this._rate,
        'sinopsis': this._sinopsis,
        'releaseYear': this._releaseYear,
        'imageUrl': this._imageUrl,
        'bannerImageUrl': this._bannerImageUrl,
      };

  String get getTittle => _tittle;

  String get getImageUrl => _imageUrl;

  String get getBannerImageUrl => _bannerImageUrl;

  set setTittle(String value) => _tittle = value;

  int get getDuration => _duration;

  set setDuration(int duration) => _duration = duration;

  List<Genre> get getGenre => _genre;

  set setGenre(List value) => _genre = value;

  Language get getLanguage => _language;

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

  /// Devuelve un List<String> con la información de la película en el siguiente orden:
  /// [tittle, duration, directorName, genres, language, subsLanguage, rate, sinopsis, releaseYear, imageUrl, bannerImageUrl]
  List<String> getMovieData() {
    List<String> movieData = List();
    List<Genre> genresList = this.getGenre;
    List<Language> languagesList = this.getSubsLanguage;
    String genres = "";
    String subsLanguage = "";

    for (Genre genre in genresList) {
      if (genre == genresList.last) {
        genres += genre.getGenreName;
      } else {
        genres += genre.getGenreName + " | ";
      }
    }

    for (Language language in languagesList) {
      if (language == languagesList.last) {
        subsLanguage += language.getLanguageName;
      } else {
        subsLanguage += language.getLanguageName + " | ";
      }
    }

    movieData.add(this.getTittle);
    movieData.add(this.getDuration.toString());
    movieData.add(this.getDirector.getName);
    movieData.add(genres);
    movieData.add(this.getLanguage.getLanguageName);
    movieData.add(subsLanguage);
    movieData.add(this.getRate.toString());
    movieData.add(this.getSinopsis);
    movieData.add(this.getReleaseYear.toString());
    movieData.add(this.getImageUrl);
    movieData.add(this.getBannerImageUrl);

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
