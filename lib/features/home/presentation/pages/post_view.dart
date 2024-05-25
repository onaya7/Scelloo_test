import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:scelloo_test/componenets/custom_scaffold.dart';
import 'package:scelloo_test/core/device/routes/routes_manager.dart';
import 'package:scelloo_test/features/home/presentation/bloc/home_bloc.dart';
import 'package:scelloo_test/features/home/presentation/widgets/posttileshimmer.dart';
import 'package:scelloo_test/utils/constants/color_constants.dart';
import 'package:scelloo_test/utils/helpers/helpers.dart';

import '../../../../componenets/custom_button.dart';
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
    getIt.call<HomeBloc>().add(PostFetchingEvent());
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
        // listenWhen: (previous, current) => current is HomeActionState,
        // buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          // if (state is PostFetchingErrorState) {
          //   final postErrorState = state;
          //   Helpers.showToast(context, 'error', postErrorState.error);
          // }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (PostFetchingLoadingState):
              return const PostTileShimmer();

            case const (PostFetchingErrorState):
              final postErrorState = state as PostFetchingErrorState;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.sentiment_dissatisfied_rounded,
                      color: ColorConstants.primary,
                      size: 50,
                    ),
                    const Gap(10),
                    Text(postErrorState.error),
                    const Gap(20),
                    CustomButton(
                        width: 200,
                        text: 'Refresh',
                        textColor: ColorConstants.white,
                        backgroundColor: ColorConstants.primary,
                        onPressed: () {
                          getIt.call<HomeBloc>().add(PostFetchingEvent());
                        }),
                  ],
                ),
              );
            case const (PostFetchingLoadedState):
              final postLoadedState = state as PostFetchingLoadedState;
              return CustomRefreshIndicator(
                onRefresh: () async {
                  getIt.call<HomeBloc>().add(PostFetchingEvent());
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

                            return PostTile(
                              title: title,
                              body: body,
                              onPostTileTap: () => Helpers.navigateToPage(
                                RoutesManager.postDetailRoute,
                                arguments: {
                                  'title': title,
                                  'body': body,
                                  'userId': userId,
                                  'id': id,
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
