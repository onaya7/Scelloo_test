import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scelloo_test/componenets/custom_refreshindicator.dart';
import 'package:scelloo_test/componenets/custom_scaffold.dart';
import 'package:scelloo_test/core/device/routes/routes_manager.dart';
import 'package:scelloo_test/features/home/presentation/widgets/confirmdelete_bottomsheet.dart';
import 'package:scelloo_test/utils/constants/color_constants.dart';
import 'package:scelloo_test/utils/helpers/helpers.dart';

import '../widgets/posttile.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

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
      body: CustomRefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListView.separated(
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const Gap(10),
                  itemBuilder: (context, index) {
                    return PostTile(
                      title: 'Title',
                      body: 'Body',
                      onPostTileTap: () => Helpers.navigateToPage(
                        RoutesManager.postDetailRoute,
                        arguments: {
                          'title':
                              'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
                          'body':
                              'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto',
                          'userId': '3',
                          'id': '1',
                        },
                      ),
                      onEditTap: () => Helpers.navigateToPage(
                        RoutesManager.postEditRoute,
                      ),
                      onDeleteTap: () => ConfirmDeleteBottomSheet.show(context),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
