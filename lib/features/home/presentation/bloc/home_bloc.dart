import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scelloo_test/features/home/domain/usecases/get_posts.dart';
import 'package:scelloo_test/injection_container.dart';

import '../../data/models/post_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // final GetPosts getPosts;
  // final GetPostDetails getPostDetails;
  // final CreatePost createPost;
  // final UpdatePost updatePost;
  // final DeletePost deletePost;

  HomeBloc() : super(HomeInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<HomeState> emit) async {
    emit(PostLoadingState());
    List<Post> posts = await getIt.call<GetPosts>().call();
    emit(PostLoadedState(posts: posts));
  }
}
