class UsersModel {
  int id;
  String name;
  String userName;
  String email;

  UsersModel({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'],
      name: json['name'],
      userName: json['username'],
      email: json['email'],
    );
  }
}
