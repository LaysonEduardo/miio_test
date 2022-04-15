import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miio_test/app/modules/configuration/states/configuration_states.dart';
import 'package:miio_test/app/modules/home/event/home_event.dart';

class HomeBloc extends Bloc<HomeEvent, AppState> {
  HomeBloc(AppState initialState) : super(initialState);
}
