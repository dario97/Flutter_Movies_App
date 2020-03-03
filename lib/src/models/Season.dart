import 'package:app_peliculas/src/models/Episode.dart';

class Season{
  String _tittle;
  List<Episode> _episodes;

  Season.fromJson(Map<String,dynamic> json){
    List listE = json['episodes'];
    
    List<Episode> episodesList = listE.map((i){
      Map<String,dynamic> episodesJson = Map.from(i);
      return Episode.fromJson(episodesJson);
    }).toList();

    _tittle = json['tittle'];
    _episodes = episodesList; 
  }

  String get getTittle => _tittle;
  List<Episode> get getEpisodes => _episodes;
}