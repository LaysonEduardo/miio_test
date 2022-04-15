import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_test/app/modules/post/events/post_events.dart';
import 'package:miio_test/app/modules/post/state/post_state.dart';

import '../../configuration/services/posts_services.dart';

class PostBloc extends Bloc<PostEvents, PostState> {
  final PostServices post = Modular.get<PostServices>();

  PostBloc() : super(PostBlankState()) {
    on<FetchPost>(
      (event, emit) async => emit(
        PostSuccessState(post: await post.fetch(event.id), user: await post.fetchUser(), comments: await post.fetchComments()),
      ),
    );
  }
}
