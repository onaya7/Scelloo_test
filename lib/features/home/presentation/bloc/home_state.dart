part of 'home_bloc.dart';

@immutable

//normal state
sealed class HomeState {}

//action state
abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class PostLoadingState extends HomeState {}

final class PostLoadedState extends HomeState {
  final List<Post> posts;

  PostLoadedState({required this.posts});
}

final class PostErrorState extends HomeState {
  final String error;

  PostErrorState({required this.error});
}
