import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:scelloo_test/core/instance/logger.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../utils/constants/color_constants.dart';
import '../../../../../utils/helpers/helpers.dart';
import '../../../../componenets/custom_button.dart';
import '../bloc/home_bloc.dart';

class ConfirmDeleteBottomSheet {
  const ConfirmDeleteBottomSheet._();
  static show(BuildContext context, {required int id}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: BottomSheet(
            id: id,
          ),
        );
      },
    );
  }
}

class BottomSheet extends StatelessWidget {
  final int id;
  const BottomSheet({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    logger.i('id: $id');
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => Helpers.popPage(),
                child: Assets.icons.xCloseBorder.svg(),
              ),
            ],
          ),
          const Gap(10),
          Assets.icons.warning.svg(),
          const Gap(40),
          const Text(
            'Delete Post',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: ColorConstants.textHeader,
            ),
          ),
          const Gap(10),
          const SizedBox(
            width: 261,
            child: Text(
              'Are you sure you want to delete your this post? This action cannot be undone',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: ColorConstants.textBody,
              ),
            ),
          ),
          const Gap(43),
          CustomButton(
            text: 'No',
            borderColor: ColorConstants.grey300,
            textColor: ColorConstants.textHeader,
            backgroundColor: ColorConstants.white,
            onPressed: () => Helpers.popPage(),
          ),
          const Gap(7),
          BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is PostDeleteErrorState) {
                final postErrorState = state;
                Helpers.showToast(context, 'error', postErrorState.error);
                Helpers.popPage();
              } else if (state is PostFetchingLoadedState) {
                Helpers.showToast(
                    context, 'success', 'Post deleted successfully');
                Helpers.popPage();
              }
            },
            child: CustomButton(
              text: 'Yes',
              textColor: ColorConstants.white,
              backgroundColor: ColorConstants.red600,
              onPressed: () {
                context.read<HomeBloc>().add(PostDeleteEvent(postId: id));
              },
              isLoading:
                  context.watch<HomeBloc>().state is PostDeleteLoadingState,
            ),
          ),
          const Gap(7),
        ],
      ),
    );
  }
}
