

class Director {
  String _name = "";
  String _imageUrl = "";

  Director(this._name, this._imageUrl);
  Director.nameOnly(this._name);
  Director.fromJson(Map<String, dynamic> json) {
    this._name = json['name'];
    if(json.containsKey('imageUrl')){
      this._imageUrl = json['imageUrl'];
    }
    
  }

  Map<String, dynamic> toJson() => {
        'name': this._name,
        'imageUrl': this._imageUrl,
      };

  String get getName => this._name;
  String get getImageUrl => this._imageUrl;
}
