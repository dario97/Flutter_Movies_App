import 'package:app_peliculas/src/models/Film.dart';
import 'package:app_peliculas/src/models/Genre.dart';
import 'package:app_peliculas/src/models/Language.dart';
import 'Season.dart';

class Serie implements Film {
  String _tittle;
  List<Genre> _genre;
  Language _language;
  List<Language> _subtittlesLanguage;
  double _rate;
  String _sinopsis;
  int _releaseYear;
  String _imageUrl;
  String _bannerImageUrl;
  List<Season> _seasons;
  bool _enEmision;

  Serie.fromJson(Map<String, dynamic> json) {
    List listL = json['subtittlesLanguage'];
    List listG = json['genre'];
    List listS = json['seasons'];

    Map<String, dynamic> languageJson = Map.from(json['language']);

    List<Genre> genresList = listG.map((i) {
      Map<String, dynamic> genreJson = Map.from(i);
      return Genre.fromJson(genreJson);
    }).toList();

    List<Language> subLanguagesList = listL.map((i) {
      Map<String, dynamic> languageJson = Map.from(i);
      return Language.fromJson(languageJson);
    }).toList();

    List<Season> seasonsList = listS.map((i) {
      Map<String, dynamic> seasonJson = Map.from(i);
      return Season.fromJson(seasonJson);
    }).toList();

    _tittle = json['titulo'];
    _genre = genresList;
    _language = Language.fromJson(languageJson);
    _subtittlesLanguage = subLanguagesList;
    _rate = json['rate'];
    _sinopsis = json['sinopsis'];
    _releaseYear = json['releaseYear'];
    _imageUrl = json['imageUrl'];
    _bannerImageUrl = json['bannerImageUrl'];
    _seasons = seasonsList;
    _enEmision = json['enEmision'];
  }

  @override
  String get getBannerImageUrl => _bannerImageUrl;

  @override
  List<Genre> get getGenre => _genre;

  @override
  String get getImageUrl => _imageUrl;

  @override
  Language get getLanguage => _language;

  @override
  double get getRate => _rate;

  @override
  int get getReleaseYear => _releaseYear;

  @override
  String get getSinopsis => _sinopsis;

  @override
  List<Language> get getSubsLanguage => _subtittlesLanguage;

  @override
  String get getTittle => _tittle;

  @override
  Map<String, dynamic> toJson() => {
        'titulo': _tittle,
        'genre': _genre,
        'language': _language,
        'subtittlesLanguage': _subtittlesLanguage,
        'rate': _rate,
        'sinopsis': _sinopsis,
        'releaseYear': _releaseYear,
        'imageUrl': _imageUrl,
        'bannerImageUrl': _bannerImageUrl,
        'seasons': _seasons,
        'enEmision': _enEmision,
      };
}
