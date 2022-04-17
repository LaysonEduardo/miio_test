import 'package:dio/dio.dart';
import 'package:miio_test/app/modules/configuration/models/comment_model.dart';
import 'package:miio_test/app/modules/configuration/models/post_model.dart';
import 'package:miio_test/app/modules/configuration/models/user_model.dart';
import 'package:miio_test/core/services/http/dio_services.dart';

class PostServices {
  List<PostModel> posts = [];
  late PostModel post;
  final DioServices dio;

  PostServices(this.dio);

  Future<PostModel> fetch(int id) async {
    final response = await dio.get('/posts/$id', {});
    post = PostModel.fromJson(response.data);
    return post;
  }

  Future<List<PostModel>> fetchAll() async {
    final Response response = await dio.get('/posts', {"_limit": 5});
    posts = response.data.map<PostModel>((json) => PostModel.fromJson(json)).toList();
    return posts;
  }

  Future<UserModel> fetchUser() async {
    final Response response = await dio.get('/users/${post.userId}', {});
    return UserModel.fromJson(response.data);
  }

  Future<List<CommentModel>> fetchComments() async {
    final Response response = await dio.get('/posts/${post.id}/comments', {"_limit": 5});
    return response.data.map<CommentModel>((json) => CommentModel.fromJson(json)).toList();
  }

  Future<List<PostModel>> increase() async {
    if (posts.length < 70) {
      final Response response = await dio.get('/posts', {"_start": posts.length, "_limit": 5});
      posts.addAll(response.data.map<PostModel>((json) => PostModel.fromJson(json)).toList());
      return posts;
    }
    return posts;
  }

  List<PostModel> search(String string) {
    List<PostModel> filtredPosts = posts.where((element) => element.title.toLowerCase().contains(string.toLowerCase())).toList();

    return filtredPosts;
  }
}
