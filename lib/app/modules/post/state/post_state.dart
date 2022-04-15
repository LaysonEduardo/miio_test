import 'package:miio_test/app/modules/configuration/models/comment_model.dart';
import 'package:miio_test/app/modules/configuration/models/post_model.dart';
import 'package:miio_test/app/modules/configuration/models/user_model.dart';

abstract class PostState {
  PostModel? post;
  UserModel? user;
  List<CommentModel> comments;

  PostState({
    required this.post,
    required this.user,
    required this.comments,
  });
}

class PostBlankState extends PostState {
  PostBlankState() : super(post: null, user: null, comments: []);
}

class PostloadingState extends PostState {
  PostloadingState() : super(post: null, user: null, comments: []);
}

class PostSuccessState extends PostState {
  PostSuccessState({required PostModel post, required UserModel user, required List<CommentModel> comments}) : super(post: post, user: user, comments: comments);
}
