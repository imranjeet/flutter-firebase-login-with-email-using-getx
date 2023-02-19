class UserModel {
  late String id, title, description, image;

  UserModel(
      {required this.description,
      required this.title,
      required this.id,
      required this.image});

  UserModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
    image = map['img'];
  }
}
