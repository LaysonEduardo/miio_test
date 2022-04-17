import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miio_test/app/modules/home/bloc/home_bloc.dart';
import 'package:miio_test/app/modules/home/events/home_events.dart';
import 'package:miio_test/app/modules/home/state/home_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  blocTest<HomeBloc, HomeState>(
    'HomeBloc Testing FetchPost',
    build: () {
      final postServicesMock = PostServicesMock();
      when(() => postServicesMock.fetchAll()).thenAnswer((_) async => [PostModelMock()]);
      return HomeBloc(postServicesMock);
    },
    act: (bloc) => bloc.add(FetchPosts()),
    expect: () => [isA<HomeSuccessState>()],
  );

  blocTest<HomeBloc, HomeState>(
    'Home Testing Increment Post',
    build: () {
      final postServicesMock = PostServicesMock();
      when(() => postServicesMock.fetchAll()).thenAnswer((_) async => [PostModelMock()]);
      when(() => postServicesMock.increase()).thenAnswer((_) async => [PostModelMock()]);
      return HomeBloc(postServicesMock);
    },
    act: (bloc) {
      bloc.add(FetchPosts());
      bloc.add(IncrementPosts());
    },
    expect: () => [isA<HomeSuccessState>(), isA<HomeSuccessState>()],
  );

  blocTest<HomeBloc, HomeState>(
    'Home Testing Search Post',
    build: () {
      final postServicesMock = PostServicesMock();
      when(() => postServicesMock.fetchAll()).thenAnswer((_) async => [PostModelMock()]);
      when(() => postServicesMock.search('test')).thenReturn([PostModelMock()]);
      return HomeBloc(postServicesMock);
    },
    act: (bloc) {
      bloc.add(FetchPosts());
      bloc.add(SearchPosts(string: 'test'));
    },
    expect: () => [isA<HomeSuccessState>(), isA<HomeSuccessState>()],
  );
}
