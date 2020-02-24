class Genre {
  String _genreName;

  Genre(this._genreName);
  Genre.fromJson(Map<String, dynamic> json) {
    this._genreName = json['genreName'];
  }
  Map<String, dynamic> toJson() => {
        'genreName': this._genreName,
      };

  // GETTERS AND SETTERS
  String get getGenreName => _genreName;
}
