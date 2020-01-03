class Movie {
  String _titulo;
  String _portada;

  Movie(String titulo, String portada){
    this._titulo = titulo;
    this._portada = portada;
  }

  String get titulo => _titulo;
  String get portada => _portada;
  set titulo(String titulo){
    this._titulo = titulo;
  }
  set portada(String portada){
    this._portada = portada;
  }
}

    
