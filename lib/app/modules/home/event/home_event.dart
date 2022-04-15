abstract class HomeEvent {}

class FetchPosts extends HomeEvent {}

class SearchPosts extends HomeEvent {
  final String string;

  SearchPosts({required this.string});
}

class IncrementPosts extends HomeEvent {}
