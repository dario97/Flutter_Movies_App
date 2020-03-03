class Episode {
  String _tittle;
  String _sinopsis;

  Episode.fromJson(Map<String,dynamic> json){
    _tittle = json['tittle'];
    _sinopsis = json['sinopsis'];
  }

  Map<String,dynamic> toJson() => {
    'tittle': this._tittle,
    'sinopsis': this._sinopsis,
  };

  String get getTittle => _tittle;
  String get getSinopsis => _sinopsis;
}