import 'package:app_peliculas/src/models/Genre.dart';
import 'package:app_peliculas/src/models/Language.dart';

abstract class Film {
  Map<String, dynamic> toJson();
  String get getTittle;
  List<Genre> get getGenre;
  Language get getLanguage;
  double get getRate;
  String get getSinopsis;
  int get getReleaseYear;
  String get getImageUrl;
  String get getBannerImageUrl;
  List<Language> get getSubsLanguage;
  // int get getDuration;
  // Director get getDirector;

}
