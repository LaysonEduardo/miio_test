abstract class PostEvents {
  final int id;
  PostEvents(this.id);
}

class FetchPost extends PostEvents {
  FetchPost(int id) : super(id);
}

class FetchComments extends PostEvents {
  FetchComments(int id) : super(id);
}
