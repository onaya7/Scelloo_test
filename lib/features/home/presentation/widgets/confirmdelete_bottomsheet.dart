import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../utils/constants/color_constants.dart';
import '../../../../../utils/helpers/helpers.dart';
import '../../../../componenets/custom_button.dart';

class ConfirmDeleteBottomSheet {
  const ConfirmDeleteBottomSheet._();
  static show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const SingleChildScrollView(
          child: BottomSheet(),
        );
      },
    );
  }
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
          CustomButton(
            text: 'Yes',
            textColor: ColorConstants.white,
            backgroundColor: ColorConstants.red600,
            onPressed: () {
              Helpers.popPage();
            },
          ),
          const Gap(7),
        ],
      ),
    );
  }
}
