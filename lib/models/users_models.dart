class UsersModel{

  var name;
  var image;
  var description;

  UsersModel({this.name, this.image, this.description});

  factory UsersModel.fromJSON(Map map) {
    return UsersModel(name: map['name'], image: map['iconURL'], description: map['description']);
  }

}