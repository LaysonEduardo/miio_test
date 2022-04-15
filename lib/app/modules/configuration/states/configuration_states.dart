abstract class AppState {}

class LoadingState implements AppState {}

class ErrorState implements AppState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}

class SuccessState implements AppState {}

class BlankState implements AppState {}
