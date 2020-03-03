class Director {
  String _name = "";
  String _imageUrl = "";

  Director(this._name, this._imageUrl);
  // Director.nameOnly(this._name);

  factory Director.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('imageUrl')) {
      return Director(json['name'], json['imageUrl']);
    } else {
      return Director(json['name'], "");
    }
  }

  Map<String, dynamic> toJson() => {
        'name': this._name,
        'imageUrl': this._imageUrl,
      };

  String get getName => this._name;
  String get getImageUrl => this._imageUrl;
}
