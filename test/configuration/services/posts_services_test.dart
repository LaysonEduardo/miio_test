import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miio_test/app/modules/configuration/models/comment_model.dart';
import 'package:miio_test/app/modules/configuration/models/post_model.dart';
import 'package:miio_test/app/modules/configuration/models/user_model.dart';
import 'package:miio_test/app/modules/configuration/services/posts_services.dart';
import 'package:miio_test/core/services/http/dio_services.dart';

void main() {
  final dio = DioServices(dio: Dio());
  final postService = PostServices(dio);

  setUp(() {
    dio.init();
  });

  test('Testing PostServices Fetch', () async {
    final post = await postService.fetch(1);
    expect(post, isA<PostModel>());
  });

  test('Testing PostServices FetchAll', () async {
    final list = await postService.fetchAll();
    expect(list, isA<List<PostModel>>());
  });

  test('Testing PostServices FetchUser', () async {
    final user = await postService.fetchUser();
    expect(user, isA<UserModel>());
  });

  test('Testing PostServices FetchComments', () async {
    final list = await postService.fetchComments();
    expect(list, isA<List<CommentModel>>());
  });

  test('Testing PostServices Increase', () async {
    final list = await postService.increase();
    expect(list, isA<List<PostModel>>());
  });

  test('Testing PostServices Search', () async {
    final list = postService.search('title');
    expect(list, isA<List<PostModel>>());
  });
}
