part of 'home_bloc.dart';

@immutable

//normal state
sealed class HomeState {}

//action state
abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class PostFetchingLoadingState extends HomeState {}

final class PostFetchingLoadedState extends HomeState {
  final List<Post> posts;

  PostFetchingLoadedState({required this.posts});
}

final class PostFetchingErrorState extends HomeState {
  final String error;

  PostFetchingErrorState({required this.error});
}

final class PostCreateLoadingState extends HomeState {}

final class PostCreateLoadedState extends HomeState {
  final Post post;

  PostCreateLoadedState({required this.post});
}

final class PostCreateErrorState extends HomeState {
  final String error;

  PostCreateErrorState({required this.error});
}
