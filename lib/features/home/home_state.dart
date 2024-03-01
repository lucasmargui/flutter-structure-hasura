abstract class HomeState {}

//a classe HomeLoadingState está herdando de HomeSate

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState(this.message);
}
