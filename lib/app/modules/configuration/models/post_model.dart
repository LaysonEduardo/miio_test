class PostModel {
  int id;
  int userId;

  String title;
  String body;
  String userImage;
  String image;

  PostModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.userImage,
    required this.image,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
      userImage: 'https://i.pravatar.cc/150?img=${json['userId']}',
      image: 'https://picsum.photos/seed/${json['id']}/450/250',
    );
  }
}
