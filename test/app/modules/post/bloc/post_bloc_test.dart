import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miio_test/app/modules/post/bloc/post_bloc.dart';
import 'package:miio_test/app/modules/post/events/post_events.dart';
import 'package:miio_test/app/modules/post/state/post_state.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../mocks/mocks.dart';

void main() {
  blocTest<PostBloc, PostState>(
    'Post testing FetchPost',
    build: () {
      final postServicesMock = PostServicesMock();
      when(() => postServicesMock.fetch(0)).thenAnswer((_) async => PostModelMock());
      when(() => postServicesMock.fetchUser()).thenAnswer((_) async => UserModelMock());
      when(() => postServicesMock.fetchComments()).thenAnswer((_) async => [CommentModelMock()]);
      return PostBloc(postServicesMock);
    },
    act: (bloc) => bloc.add(FetchPost(0)),
    expect: () => [isA<PostSuccessState>()],
  );
}
