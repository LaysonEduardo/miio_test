import 'package:miio_test/app/modules/configuration/models/post_model.dart';

abstract class HomeState {
  List<PostModel> posts;

  HomeState({required this.posts});
}

class HomeBlankState extends HomeState {
  HomeBlankState() : super(posts: []);
}

class HomeSuccessState extends HomeState {
  HomeSuccessState({required List<PostModel> posts}) : super(posts: posts);
}

class HomeFailState extends HomeState {
  HomeFailState() : super(posts: []);
}
