abstract class HomeEvent {}

class FetchPosts extends HomeEvent {}

class FilterPosts extends HomeEvent {
  final String string;

  FilterPosts({required this.string});
}
