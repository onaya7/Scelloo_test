import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scelloo_test/features/home/domain/usecases/create_post.dart';
import 'package:scelloo_test/features/home/domain/usecases/get_posts.dart';
import 'package:scelloo_test/injection_container.dart';

import '../../data/models/post_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {


  HomeBloc() : super(HomeInitial()) {
    on<PostFetchingEvent>(postFetchingEvent);
    on<PostCreateEvent>(postCreateEvent);
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

  FutureOr<void> postCreateEvent(
      PostCreateEvent event, Emitter<HomeState> emit) async {
    emit(PostCreateLoadingState());
    try {
      Post post = await getIt.call<CreatePost>().call(event.post);
      emit(PostCreateLoadedState(post: post));
    } catch (e) {
      emit(PostCreateErrorState(error: e.toString()));
    }
  }
}
