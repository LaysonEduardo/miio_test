class UserModel {
  int id;
  String name;
  String email;
  String image;
  String company;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      image: 'https://i.pravatar.cc/150?img=${json['id']}',
      company: json['company']['name'],
    );
  }
}
