import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_test/app/modules/configuration/services/post/posts_services.dart';
import 'package:miio_test/app/modules/home/event/home_event.dart';
import 'package:miio_test/app/modules/home/state/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PostServices post = Modular.get<PostServices>();
  HomeBloc() : super(HomeBlankState()) {
    on<FetchPosts>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 1500), () {
        emit(
          HomeSuccessState(posts: []),
        );
      });
    });

    on<SearchPosts>((event, emit) => HomeSuccessState(posts: []));
  }
}
