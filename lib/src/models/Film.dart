import 'package:app_peliculas/src/models/Genre.dart';
import 'package:app_peliculas/src/models/Language.dart';

abstract class Film {
  String _tittle = "";
  List<Genre> _genre = List();
  Language _language;
  List<Language> _subtittlesLanguage = List();
  double _rate = 0;
  String _synopsis = "";
  int _releaseYear = 0;
  String _imageUrl = "";
  String _bannerImageUrl = "";

  Film.fromJson(Map<String, dynamic> json){

  }

  String get getTittle => _tittle;
  List<Genre> get getGenre => _genre;
  Language get getLanguage => _language;
  double get getRate => _rate;
  String get getSynopsis => _synopsis;
  int get getReleaseYear => _releaseYear;
  String get getImageUrl => _imageUrl;
  String get getBannerImageUrl => _bannerImageUrl;
}
