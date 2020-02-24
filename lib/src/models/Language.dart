class Language {
  String _languageName;

  Language(this._languageName);
  Language.fromOther(Language language){
    this._languageName = language.getLanguageName;
  }
  Language.fromJson(Map<String, dynamic> json) {
    this._languageName = json['languageName'];
  }

  Map<String, dynamic> toJson() => {
        'languageName': this._languageName,
      };

  // GETTERS AND SETTERS
  String get getLanguageName => this._languageName;
}
