class Restaurant {
  String _imagePath;
  String _name;
  String _location;
  String _description;
  double _rating;

  Restaurant(this._imagePath, this._name, this._location, this._description,
      this._rating);

  get imagePath => this._imagePath;

  set imagePath(value) => this._imagePath = value;

  get name => this._name;

  set name(value) => this._name = value;

  get location => this._location;

  set location(value) => this._location = value;

  String get description => this._description;

  set description(String value) => this._description = value;

  double get rating => this._rating;

  set rating(double value) => this._rating = value;
}
