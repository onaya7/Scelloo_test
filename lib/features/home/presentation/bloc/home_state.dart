part of 'home_bloc.dart';

@immutable

//normal state -------------------------------------
sealed class HomeState {}

//action state -------------------------------------
abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

//post fetching states -------------------------------------

final class PostFetchingLoadingState extends HomeState {}

final class PostFetchingLoadedState extends HomeState {
  final List<Post> posts;

  PostFetchingLoadedState({required this.posts});
}

final class PostFetchingErrorState extends HomeState {
  final String error;

  PostFetchingErrorState({required this.error});
}

//post create states -------------------------------------

final class PostCreateLoadingState extends HomeState {}

final class PostCreateLoadedState extends HomeState {
  final Post post;

  PostCreateLoadedState({required this.post});
}

final class PostCreateErrorState extends HomeState {
  final String error;

  PostCreateErrorState({required this.error});
}

//post update states -------------------------------------

class PostUpdateLoadingState extends HomeState {}

class PostUpdateLoadedState extends HomeState {}

class PostUpdateErrorState extends HomeState {
  final String error;

  PostUpdateErrorState({required this.error});
}

//post delete states -------------------------------------

class PostDeleteLoadingState extends HomeState {}

class PostDeleteLoadedState extends HomeState {}

class PostDeleteErrorState extends HomeState {
  final String error;

  PostDeleteErrorState({required this.error});
}
