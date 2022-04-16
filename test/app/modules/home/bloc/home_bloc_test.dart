import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miio_test/app/modules/home/bloc/home_bloc.dart';
import 'package:miio_test/app/modules/home/events/home_events.dart';
import 'package:miio_test/app/modules/home/state/home_state.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}
void main() {
  HomeBloc? _bloc;

  setUp(() {
    _bloc = MockHomeBloc();
  });
  
  group('HomeBloc Test', () {
    whenListen(MockHomeBloc(), Stream.fromFuture(future))
    blocTest<HomeBloc, HomeState>(
      'test',
      build: () => _bloc!,
      act: (bloc) => bloc.add(FetchPosts()),
      expect: () => [isA<HomeSuccessState>()],
    );
  });
}
