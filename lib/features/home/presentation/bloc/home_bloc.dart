import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scelloo_test/core/instance/logger.dart';
import 'package:scelloo_test/features/home/domain/usecases/create_post.dart';
import 'package:scelloo_test/features/home/domain/usecases/get_posts.dart';
import 'package:scelloo_test/features/home/domain/usecases/update_post.dart';
import 'package:scelloo_test/injection_container.dart';

import '../../data/models/post_model.dart';
import '../../domain/usecases/delete_post.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<PostFetchingEvent>(postFetchingEvent);
    on<PostCreateEvent>(postCreateEvent);
    on<PostUpdateEvent>(postUpdateEvent);
    on<PostDeleteEvent>(postDeleteEvent);
  }

  FutureOr<void> postFetchingEvent(
      PostFetchingEvent event, Emitter<HomeState> emit) async {
    emit(PostFetchingLoadingState());
    try {
      List<Post> posts = await getIt.call<GetPosts>().call();
      emit(PostFetchingLoadedState(posts: posts));
    } catch (e) {
      emit(PostFetchingErrorState(error: e.toString()));
    }
  }

  int lastId = 100;
  Future<void> postCreateEvent(
      PostCreateEvent event, Emitter<HomeState> emit) async {
    if (state is PostFetchingLoadedState) {
      final currentState = state as PostFetchingLoadedState;
      emit(PostCreateLoadingState());
      try {
        Post newPost = await getIt.call<CreatePost>().call(event.post);
        lastId++;
        newPost.id = lastId;
        final updatedPosts = List<Post>.from(currentState.posts)..add(newPost);
        emit(PostFetchingLoadedState(posts: updatedPosts));
      } catch (e) {
        emit(PostCreateErrorState(error: e.toString()));
        emit(currentState);
      }
    }
  }

  FutureOr<void> postUpdateEvent(
      PostUpdateEvent event, Emitter<HomeState> emit) async {
    if (state is PostFetchingLoadedState) {
      final currentState = state as PostFetchingLoadedState;
      emit(PostUpdateLoadingState());
      try {
        final updatedPost =
            await getIt.call<UpdatePost>().call(event.post['id'], event.post);

        final updatedPosts = currentState.posts.map((post) {
          if (post.id == event.post['id']) {
            return updatedPost;
          }
          return post;
        }).toList();

        emit(PostFetchingLoadedState(posts: updatedPosts));
      } catch (e) {
        emit(PostUpdateErrorState(error: e.toString()));
        emit(currentState);
      }
    }
  }

  Future<void> postDeleteEvent(
    PostDeleteEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (state is! PostFetchingLoadedState) {
      logger.e('Invalid state: expected PostFetchingLoadedState');
      return;
    }

    final currentState = state as PostFetchingLoadedState;
    emit(PostDeleteLoadingState());

    try {
      // To Delete the post from the backend
      // final deletePost = getIt.get<DeletePost>().call(event.postId);
      // To Remove the post from the local list
      final updatedPosts =
          currentState.posts.where((post) => post.id != event.postId).toList();
      emit(PostFetchingLoadedState(posts: updatedPosts));
    } catch (e) {
      logger.e('An error occurred during post deletion: $e');
      emit(PostDeleteErrorState(error: e.toString()));
      emit(currentState);
    }
  }
}
