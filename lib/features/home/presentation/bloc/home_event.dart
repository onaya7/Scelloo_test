part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class PostFetchingEvent extends HomeEvent {}

final class PostCreateEvent extends HomeEvent {
  final Map<String, dynamic> post;
  PostCreateEvent({required this.post});
}


class PostUpdateEvent extends HomeEvent {
  final Map<String, dynamic> post;

  PostUpdateEvent({required this.post});
}

class PostDeleteEvent extends HomeEvent {
  final int postId;

  PostDeleteEvent({required this.postId});
}