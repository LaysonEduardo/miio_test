import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_test/app/modules/configuration/services/posts_services.dart';
import 'package:miio_test/app/modules/home/events/home_events.dart';
import 'package:miio_test/app/modules/home/state/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PostServices post = Modular.get<PostServices>();
  HomeBloc() : super(HomeBlankState()) {
    on<FetchPosts>((event, emit) async => emit(HomeSuccessState(posts: await post.fetchAll())));

    on<IncrementPosts>((event, emit) async => emit(HomeSuccessState(posts: await post.increase())));

    on<SearchPosts>((event, emit) => emit(HomeSuccessState(posts: post.search(event.string))));
  }
}
