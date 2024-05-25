import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:scelloo_test/componenets/custom_scaffold.dart';
import 'package:scelloo_test/core/device/routes/routes_manager.dart';
import 'package:scelloo_test/core/instance/logger.dart';
import 'package:scelloo_test/features/home/presentation/bloc/home_bloc.dart';
import 'package:scelloo_test/utils/constants/color_constants.dart';
import 'package:scelloo_test/utils/helpers/helpers.dart';

import '../../../../componenets/custom_refreshindicator.dart';
import '../../../../injection_container.dart';
import '../widgets/confirmdelete_bottomsheet.dart';
import '../widgets/posttile.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  void initState() {
    super.initState();
    getIt.call<HomeBloc>().add(PostInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useFloatingActionButton: true,
      onFloatingActionButtonPressed: () {
        Helpers.navigateToPage(RoutesManager.postCreateRoute);
      },
      appBar: AppBar(
        title: const Text('Scelloo Post'),
        centerTitle: true,
        foregroundColor: ColorConstants.white,
        backgroundColor: ColorConstants.primary,
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: getIt.call<HomeBloc>(),
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          // if (state is HomeError) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(
          //       content: Text(state.message),
          //     ),
          //   );
          // }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (PostLoadingState):
              return const Center(
                child: CircularProgressIndicator(),
              );

            case const (PostErrorState):
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Error:}'),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () {
                        // getIt.call<HomeBloc>().add(const HomeFetch());
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            case const (PostLoadedState):
              final postLoadedState = state as PostLoadedState;
              return CustomRefreshIndicator(
                onRefresh: () async {
                  // getIt.call<HomeBloc>().add(const HomeFetch());
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListView.separated(
                          itemCount: postLoadedState.posts.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => const Gap(10),
                          itemBuilder: (context, index) {
                            var post = postLoadedState.posts[index];
                            final title = post.title;
                            final body = post.body;
                            final userId = post.userId.toString();
                            final id = post.id.toString();
                            logger.i('title: $title');
                            logger.i('body: $body');
                            logger.i('userId: $userId');
                            logger.i('id: $id');
                            



                            return PostTile(
                              title: postLoadedState.posts[index].title,
                              body: postLoadedState.posts[index].body,
                              onPostTileTap: () => Helpers.navigateToPage(
                                RoutesManager.postDetailRoute,
                                arguments: {
                                  'title': postLoadedState.posts[index].title,
                                  'body': postLoadedState.posts[index].body,
                                  'userId': postLoadedState.posts[index].userId
                                      .toString(),
                                  'id': postLoadedState.posts[index].id
                                      .toString(),
                                },
                              ),
                              onEditTap: () => Helpers.navigateToPage(
                                RoutesManager.postEditRoute,
                              ),
                              onDeleteTap: () =>
                                  ConfirmDeleteBottomSheet.show(context),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}


   
          // if (state is HomeInitial) {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // } else if (state is PostLoadingState) {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // } else if (state is PostLoadedState) {
          //   return CustomRefreshIndicator(
          //     onRefresh: () async {
          //       await Future.delayed(const Duration(seconds: 2));
          //     },
          //     child: SingleChildScrollView(
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Column(
          //           children: [
          //             ListView.separated(
          //               itemCount: 10,
          //               physics: const NeverScrollableScrollPhysics(),
          //               shrinkWrap: true,
          //               separatorBuilder: (context, index) => const Gap(10),
          //               itemBuilder: (context, index) {
          //                 return PostTile(
          //                   title: 'Title',
          //                   body: 'Body',
          //                   onPostTileTap: () => Helpers.navigateToPage(
          //                     RoutesManager.postDetailRoute,
          //                     arguments: {
          //                       'title':
          //                           'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
          //                       'body':
          //                           'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto',
          //                       'userId': '3',
          //                       'id': '1',
          //                     },
          //                   ),
          //                   onEditTap: () => Helpers.navigateToPage(
          //                     RoutesManager.postEditRoute,
          //                   ),
          //                   onDeleteTap: () =>
          //                       ConfirmDeleteBottomSheet.show(context),
          //                 );
          //               },
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   );
          // } else if (state is PostErrorState) {
          //   return Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         const Text('Error:}'),
          //         const Gap(20),
          //         ElevatedButton(
          //           onPressed: () {
          //             // getIt.call<HomeBloc>().add(const HomeFetch());
          //           },
          //           child: const Text('Retry'),
          //         ),
          //       ],
          //     ),
          //   );
          // }
          // return const SizedBox();

// CustomRefreshIndicator(
//             onRefresh: () async {
//               await Future.delayed(const Duration(seconds: 2));
//             },
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     ListView.separated(
//                       itemCount: 10,
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       separatorBuilder: (context, index) => const Gap(10),
//                       itemBuilder: (context, index) {
//                         return PostTile(
//                           title: 'Title',
//                           body: 'Body',
//                           onPostTileTap: () => Helpers.navigateToPage(
//                             RoutesManager.postDetailRoute,
//                             arguments: {
//                               'title':
//                                   'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
//                               'body':
//                                   'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto',
//                               'userId': '3',
//                               'id': '1',
//                             },
//                           ),
//                           onEditTap: () => Helpers.navigateToPage(
//                             RoutesManager.postEditRoute,
//                           ),
//                           onDeleteTap: () =>
//                               ConfirmDeleteBottomSheet.show(context),
//                         );
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );

