import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miio_test/app/modules/post/events/post_events.dart';
import 'package:miio_test/app/modules/post/state/post_state.dart';

import '../../configuration/services/posts_services.dart';

class PostBloc extends Bloc<PostEvents, PostState> {
  final PostServices postServices;

  PostBloc(this.postServices) : super(PostBlankState()) {
    on<FetchPost>(
      (event, emit) async {
        final post = await postServices.fetch(event.id);
        final user = await postServices.fetchUser();
        final comments = await postServices.fetchComments();
        emit(PostSuccessState(post: post, user: user, comments: comments));
      },
    );
  }
}
